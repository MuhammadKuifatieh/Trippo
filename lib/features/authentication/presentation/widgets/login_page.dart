import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/design/design_constants.dart';
import 'package:trippo/core/widgets/app_loading.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:trippo/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:trippo/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:trippo/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:trippo/features/authentication/presentation/widgets/facebook_auth_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/google_auth_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Column(
        children: [
          EmailTextFeild(emailController: widget.emailController,),
          const SizedBox(height: 20),
          PasswordTextField(passwordController: widget.passwordController),
          const SizedBox(height: 35),
          Text(
            appLocalizations.openWith,
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
            },
            child: Text(
              appLocalizations.forgetPass,
              style: AppTextStyles.styleWeight400(
                      color: Theme.of(context).primaryColor, fontSize: 12)
                  .copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Spacer(),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return RoundedExpandedButton(
                onTap: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(LoginSubmitted(LoginParams(
                        username: widget.emailController.text,
                        password: widget.passwordController.text,
                      )));
                },
                color: Theme.of(context).primaryColor,
                child: state.status == AuthenticationStatus.loading
                    ? const AppLoading(
                        color: Colors.white,
                      )
                    : Text(
                        appLocalizations.login,
                        style: AppTextStyles.styleWeight400(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
