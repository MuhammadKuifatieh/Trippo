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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth_text_field.dart';
import 'check_text_row.dart';
import 'email_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
    Key? key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.fNameController,
    required this.lNameController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController fNameController;
  final TextEditingController lNameController;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                  controller: fNameController,
                  hintText: appLocalizations.fName,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AssetSvg(
                      SvgImages.person,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AuthTextField(
                  controller: lNameController,
                  hintText: appLocalizations.lName,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AssetSvg(
                      SvgImages.person,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AuthTextField(
            controller: nameController,
            hintText: appLocalizations.userName,
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
              text: appLocalizations.keepSignedIn,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CheckTextRow(
              value: true,
              onChanged: (p0) {},
              text: appLocalizations.emailMe,
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
                          firstName: fNameController.text,
                          lastName: lNameController.text,
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
                       appLocalizations.sginUp,
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
