import 'package:crypto_demo/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_header.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_row.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/register_form.dart';
import 'package:go_router/go_router.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        } else if (state.status == AuthStatus.biometricSetupRequired) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );
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
                    title: 'Create Your Account',
                    subTitle:
                        'Sign up to enjoy the best managing\n experience!',
                  ),
                  const SizedBox(height: 56),

                  const RegisterForm(),

                  const SizedBox(height: 26),

                  AuthRow(
                    message: 'Already have an account? ',
                    actionMessage: 'Login',
                    onTap: () {
                      context.pop();
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
