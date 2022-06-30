import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/design/design_constants.dart';
import 'package:trippo/core/widgets/app_loading.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/domain/use_cases/registration_use_case.dart';
import 'package:trippo/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:trippo/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_text_field.dart';
import 'check_text_row.dart';
import 'email_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
    Key? key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Column(
        children: [
          AuthTextField(
            controller: nameController,
            hintText: 'Your name',
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: AssetSvg(
                SvgImages.person,
              ),
            ),
          ),
          const SizedBox(height: 20),
          EmailTextFeild(emailController: emailController),
          const SizedBox(height: 20),
          PasswordTextField(passwordController: passwordController),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: CheckTextRow(
              value: true,
              onChanged: (p0) {},
              text: 'Keep me signed in',
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CheckTextRow(
              value: true,
              onChanged: (p0) {},
              text: 'Email me about special pricing',
            ),
          ),
          const Spacer(),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return RoundedExpandedButton(
                onTap: () {
                  context.read<AuthenticationBloc>().add(RegistrationSubmitted(
                        RegistrationParams(
                          email: emailController.text,
                          firstName: nameController.text,
                          lastName: nameController.text,
                          password: passwordController.text,
                          passwordConfirmation: passwordController.text,
                          username: nameController.text,
                        ),
                      ));
                },
                color: Theme.of(context).primaryColor,
                child: state.status == AuthenticationStatus.loading
                    ? const AppLoading(
                        color: Colors.white,
                      )
                    : Text(
                        'Create account',
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
