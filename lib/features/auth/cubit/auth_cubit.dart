import 'dart:async';
import 'package:crypto_demo/core/storage/app_storage.dart';
import 'package:crypto_demo/core/storage/secure_storage_helper.dart';
import 'package:crypto_demo/features/auth/domain/entities/user_entity.dart';
import 'package:crypto_demo/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/login_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/logout_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final LogoutUseCase _logoutUseCase;

  StreamSubscription<UserEntity?>? _authSubscription;

  AuthCubit(
    this._loginUseCase,
    this._registerUseCase,
    this._checkAuthStatusUseCase,
    this._logoutUseCase,
  ) : super(const AuthState.unknown());

  bool isLogin = false;
  bool isRegiter = false;

  Future<void> getInitialState() async {
    final hasSeenOnBoarding = await AppLaunchHelper.hasSeenOnBoarding();

    if (!hasSeenOnBoarding) {
      emit(const AuthState.onBoarding());
      return;
    }
    listenToAuthChanges();
  }

  Future<void> updateState() async {
    listenToAuthChanges();
  }

  Future<void> completeBiometrics()async{
    await AppLaunchHelper.setBiometricSetupCompleted();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  /// 🔹 Listen to Firebase auth changes
  void listenToAuthChanges() async{
    _authSubscription = _checkAuthStatusUseCase.authStateChanges.listen((
      user,
    ) async {
      if (user == null) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
        return;
      } 
       else if(isLogin){
          emit(state.copyWith(status: AuthStatus.authenticated));
          return;
        }
        else {
          await loadCurrentUser();
         emit(state.copyWith(status: AuthStatus.authenticated));
        }
    });
  }

  Future<void> loadCurrentUser()async{
    UserEntity? user = await _checkAuthStatusUseCase.getCurrentUser();
    emit(state.copyWith(status: AuthStatus.authenticated,user: user));
  }

  Future<void> completeOnBoarding() async {
    await AppLaunchHelper.setOnBoardingSeen();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  /// 🔹 Login
  Future<void> login({required String email, required String password}) async {
    final result = await _loginUseCase(email: email, password: password);

    result.when(
      onSuccess: (user) async {
        isLogin = true;
        isRegiter =false;
        await SecureStorageHelper.clearCredentials();
        await SecureStorageHelper.storeCredentials(
          email: email,
          password: password,
        );
        emit(AuthState.authenticated(user));
      },
      onError: (error) {
        isLogin = false;
        emit(AuthState.failure(error.errorDetails));
      },
    );
  }

  // Login with credentials
  Future<void> loginWithStoredCredentials() async {
    final credentials = await SecureStorageHelper.getCredentials();

    if (credentials == null) {
      await SecureStorageHelper.clearCredentials();
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: 'No stored credentials found',
        ),
      );
      return;
    }
    await login(
      email: credentials['email']!,
      password: credentials['password']!,
    );
  }

  /// 🔹 Register
  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final result = await _registerUseCase(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );

    result.when(
      onSuccess: (user) async {
        isRegiter = true;
         final biometricCompleted = await AppLaunchHelper.hasCompletedBiometricSetup();
         if(!biometricCompleted){
          emit(state.copyWith(status: AuthStatus.biometricSetupRequired));
         }
         return true;
      },
      onError: (error) {
        isRegiter = false;
        emit(AuthState.failure(error.errorDetails));
        return false;
      },
    );
    isRegiter = false;
    return false;
  }

  /// 🔹 Logout
  Future<void> logout() async {
    await _logoutUseCase();
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
