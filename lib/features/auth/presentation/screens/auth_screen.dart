// import 'package:crypto_demo/features/auth/presentation/screens/login_screen.dart';
// import 'package:crypto_demo/features/auth/presentation/screens/register_screen.dart';
// import 'package:flutter/material.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool isLogin = true;

//   void toggleScreen() {
//     setState(() {
//       isLogin = !isLogin;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 400),
//         transitionBuilder: (child, animation) {
//           return FadeTransition(
//             opacity: animation,
//             child: SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(0.0, 0.2),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             ),
//           );
//         },
//         child: isLogin
//             ? LoginScreen(
//                 key: const ValueKey('login'),
//                 onToggle: toggleScreen,
//               )
//             : RegisterScreen(
//                 key: const ValueKey('register'),
//                 onToggle: toggleScreen,
//               ),
//       ),
//     );
//   }
// }
