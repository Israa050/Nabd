import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/core/widgets/custom_text_form_field.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/forget_password_row.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Email-ID',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/email.png',
                color: context.appColors.textFormFieldIconColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/password.png',
                color: context.appColors.textFormFieldIconColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const RemebermeAndForgetPasswordRow(),
          const SizedBox(height: 25),
          AppButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await context.read<AuthCubit>().login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                );
              }
            },
            text: 'Login',
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 19 / 18,
              letterSpacing: 0.0,
              color: context.appColors.buttonTextColor,
            ),
            backgroundColor: context.appColors.buttonBackgroundColor,
          ),
        ],
      ),
    );
  }
}
