import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/core/widgets/custom_text_form_field.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _firstNameController,
            hintText: 'First Name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'First name is required';
              }
              return null;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/name.png',
                color: context.appColors.textFormFieldIconColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: _lastNameController,
            hintText: 'Last Name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Last name is required';
              }
              return null;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/name.png',
                color: context.appColors.textFormFieldIconColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 25),
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
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
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
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
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
          const SizedBox(height: 25),
          CustomTextFormField(
            controller: _phoneController,
            hintText: 'Phone',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Phone number is required';
              }
              return null;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/phone.png',
                color: context.appColors.textFormFieldIconColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 25),
          AppButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                final isSucces = await context.read<AuthCubit>().register(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                  firstName: _firstNameController.text.trim(),
                  lastName: _lastNameController.text.trim(),
                  phone: _phoneController.text.trim(),
                );
                if (isSucces) {
                  _emailController.clear();
                  _passwordController.clear();
                  _firstNameController.clear();
                  _lastNameController.clear();
                  _phoneController.clear();
                  _confirmPasswordController.clear();
                }
              }
            },
            text: 'Register',
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
