import 'package:crypto_demo/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

enum AuthStatus {
  onBoarding,
  unknown,
  unauthenticated,
  authenticated,
  biometricSetupRequired,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  const AuthState.onBoarding()
      : this(status: AuthStatus.onBoarding);

  const AuthState.unknown()
      : this(status: AuthStatus.unknown);

  const AuthState.unauthenticated()
      : this(status: AuthStatus.unauthenticated);

  const AuthState.authenticated(UserEntity user)
      : this(
          status: AuthStatus.authenticated,
          user: user,
        );

  const AuthState.biometricSetupRequired(UserEntity user)
      : this(
          status: AuthStatus.biometricSetupRequired,
          user: user,
        );

  const AuthState.failure(String message)
      : this(
          status: AuthStatus.unauthenticated,
          errorMessage: message,
        );


  AuthState copyWith({
    AuthStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}