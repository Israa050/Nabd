import 'package:crypto_demo/core/router/app_router.dart';
import 'package:crypto_demo/core/theme/app_theme.dart';
import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:crypto_demo/features/auth/presentation/screens/setup_finger_print_screen.dart';
import 'package:crypto_demo/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/di/dependency_injection.dart';
import 'package:crypto_demo/core/theme/cubit/app_theme_cubit.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'core/responsivesystem/responsivesetup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initializeDependencies();

  final authCubit = getIt<AuthCubit>();
  final biometricCubit = getIt<BiometricCubit>();
  final appThemeCubit = getIt<AppThemeCubit>();

  await authCubit.getInitialState();
  biometricCubit.checkBiometric();

  runApp(
    MyApp(
      authCubit: authCubit,
      biometricCubit: biometricCubit,
      appThemeCubit: appThemeCubit,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  final BiometricCubit biometricCubit;
  final AppThemeCubit appThemeCubit;

  const MyApp({
    super.key,
    required this.authCubit,
    required this.biometricCubit,
    required this.appThemeCubit,
  });

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(authCubit, biometricCubit).router;

    return
    //      MaterialApp(
    //  debugShowCheckedModeBanner: false,
    //         theme: AppTheme.lightTheme,
    //         darkTheme: AppTheme.darkTheme,
    //         themeMode: ThemeMode.light,
    //         builder: ResponsiveSetup.builder,
    //         home: OnBoardingScreen(),
    //     );
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: biometricCubit),
        BlocProvider.value(value: appThemeCubit),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            builder: ResponsiveSetup.builder,
            routerConfig: router,
          );
        },
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authCubit = getIt<AuthCubit>();
//     final biometricCubit = getIt<BiometricCubit>();
//     authCubit.listenToAuthChanges();

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => getIt<AuthCubit>()..getInitialState(),
//           //value: authCubit,
//         ),
//         BlocProvider.value(
//           value: biometricCubit..checkBiometric(),
//         ),
//       ],
//       child: Builder(
//         builder: (context) {
//           final router = AppRouter(getIt<AuthCubit>(), biometricCubit).router;

//           return MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             builder: ResponsiveSetup.builder,
//             routerConfig: router,
//           );
//         },
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<AuthCubit>(),
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,

//         builder: ResponsiveSetup.builder,

//         // home: RegisterScreen(),
//         // home: VerifyAccountScreen(),
//         // home: FaceIdScreen(),
//         // home: FingerPrintScreen(),
//         //home: SetupFingerPrintScreen(),
//         // home: FingerPrintScanedScreen(),
//         //home: const OnBoardingScreen(),
//         routerConfig: AppRouter(getIt<AuthCubit>()).router,
//         // home: BlocProvider(
//         //   create: (_) => getIt<AuthCubit>(),
//         //   child: const AuthWrapper(),
//         // ),
//         //home: SetupFaceIdScreen(),
//         //home: FaceIdScanningScreen(),
//         // home: FaceIdScannedScreen(),
//         //home: LoginScreen(),
//         // home: PaymentMethodScreen(),

//         // home: BlocProvider(
//         //   create: (context) => getIt<MarketCoinCubit>(),
//         //   child: MarketScreen(),
//         // ),

//         // home: BlocProvider(
//         // create: (_) => getIt<CoinDetailsCubit>(
//         // param1: '',),
//         // child: CoinDetailsScreen(),
//         // ),

//         // home: BlocProvider(
//         //   create: (context) => getIt<HomeCubit>(),
//         //   child: HomeScreen(),
//         // ),
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // TRY THIS: Try running your application with "flutter run". You'll see
//           // the application has a purple toolbar. Then, without quitting the app,
//           // try changing the seedColor in the colorScheme below to Colors.green
//           // and then invoke "hot reload" (save your changes or press the "hot
//           // reload" button in a Flutter-supported IDE, or press "r" if you used
//           // the command line to start the app).
//           //
//           // Notice that the counter didn't reset back to zero; the application
//           // state is not lost during the reload. To reset the state, use hot
//           // restart instead.
//           //
//           // This works for code too, not just values: Most code changes can be
//           // tested with just a hot reload.
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//       ),
//     );
//   }
// }
