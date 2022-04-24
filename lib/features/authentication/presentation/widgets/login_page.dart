import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:trippo/features/authentication/presentation/widgets/facebook_auth_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/google_auth_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/password_text_field.dart';

import 'auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          EmailTextFeild(emailController: widget.emailController),
          const SizedBox(height: 20),
          PasswordTextField(passwordController: widget.passwordController),
          const SizedBox(height: 35),
          Text(
            'Or continue with',
            style: AppTextStyles.styleWeight400(
              color: const Color(0xFF09051C),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              Expanded(child: GoogleAuthButton()),
              SizedBox(width: 8),
              Expanded(child: FacebookAuthButton()),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Forgot your password?',
            style: AppTextStyles.styleWeight400(
                    color: Theme.of(context).primaryColor, fontSize: 12)
                .copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          const Spacer(),
          RoundedExpandedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Login',
              style: AppTextStyles.styleWeight400(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
