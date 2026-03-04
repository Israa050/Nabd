import 'dart:async';
import 'package:crypto_demo/core/router/routes.dart';
import 'package:crypto_demo/core/widgets/home_wrapper.dart';
import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:crypto_demo/features/auth/presentation/screens/face_id_scanned_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/face_id_scanning_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/face_id_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/finger_print_scaned_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/finger_print_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/setup_face_id_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/setup_finger_print_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/verify_account_screen.dart';
import 'package:crypto_demo/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/auth/cubit/auth_state.dart';
import 'package:crypto_demo/features/auth/presentation/screens/login_screen.dart';
import 'package:crypto_demo/features/auth/presentation/screens/register_screen.dart';

class AppRouter {
  final AuthCubit authCubit;
  final BiometricCubit biometricCubit;

  AppRouter(this.authCubit, this.biometricCubit);

  late final GoRouter router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    initialLocation: Routes.splash,
    redirect: (context, state) {
      final status = authCubit.state.status;
      final location = state.matchedLocation;

      if (status == AuthStatus.unknown) {
        return location == Routes.splash ? null : Routes.splash;
      }

      if (status == AuthStatus.onBoarding) {
        return location == Routes.onBoarding ? null : Routes.onBoarding;
      }

      if (status == AuthStatus.unauthenticated) {
        const allowedRoutes = [
          Routes.login,
          Routes.register,
          Routes.fingerprint,
          Routes.faceId,
          Routes.verifyAccount,
        ];

        return allowedRoutes.contains(location) ? null : Routes.login;
      }

      if (status == AuthStatus.authenticated) {
        return location == Routes.home ? null : Routes.home;
      }

      if (status == AuthStatus.biometricSetupRequired) {
        const allowedRoutes = [
          Routes.fingerprintSetup,
          Routes.fingerprintScanned,
          Routes.faceIdSetup,
          Routes.faceIdScanning,
          Routes.faceIdScanned,
        ];

        return allowedRoutes.contains(location) ? null : Routes.fingerprintSetup;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.fingerprint,
        builder: (_, __) => const FingerPrintScreen(),
      ),
      GoRoute(path: Routes.faceId, builder: (_, __) => const FaceIdScreen()),
      GoRoute(
        path: Routes.faceIdSetup,
        builder: (_, __) => const SetupFaceIdScreen(),
      ),
      GoRoute(
        path: Routes.fingerprintSetup,
        builder: (_, __) => const SetupFingerPrintScreen(),
      ),
      GoRoute(
        path: Routes.faceIdScanning,
        builder: (_, __) => const FaceIdScanningScreen(),
      ),
      GoRoute(
        path: Routes.faceIdScanned,
        builder: (_, __) => const FaceIdScannedScreen(),
      ),
      GoRoute(
        path: Routes.fingerprintScanned,
        builder: (_, __) => const FingerPrintScanedScreen(),
      ),
      GoRoute(
        path: Routes.verifyAccount,
        builder: (_, state) => VerifyAccountScreen(
          isFaceId: state.uri.queryParameters['isFaceId'] == 'true',
        ),
      ),
      GoRoute(path: Routes.login, builder: (_, __) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (_, __) => const RegisterScreen()),
      GoRoute(
        path: Routes.splash,
        builder: (_, __) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(
        path: Routes.home,
        builder: (_, __) => HomeWrapper(),
          
          // Scaffold(
          //   body: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Text('welcome to home'),
          //         SizedBox(height: 20),
          //         ElevatedButton(
          //           onPressed: () {
          //             authCubit.logout();
          //           },
          //           child: Text('logout'),
          //         ),
          //       ],
          //     ),
          //            ),
          // ),
        ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
