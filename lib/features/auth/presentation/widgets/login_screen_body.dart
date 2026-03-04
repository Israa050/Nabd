import 'package:crypto_demo/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_header.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_row.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/login_form.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/login_spacer.dart';
import 'package:go_router/go_router.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: AuthBasePage(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 84, 17, 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthHeader(
                    title: 'Login To Your Account',
                    subTitle: "Welcome back you've \nbeen missed!",
                  ),
                  const SizedBox(height: 70),

                  const LoginForm(),

                  const SizedBox(height: 37),

                  const LoginSpacer(),

                  const SizedBox(height: 30),

                  AuthRow(
                    message: "Don't have an account? ",
                    actionMessage: 'Sign Up',
                    onTap: () {
                      context.push('/register');
                    },
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
