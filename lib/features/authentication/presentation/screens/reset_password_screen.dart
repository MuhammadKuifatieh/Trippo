import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/design/design_constants.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/password_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: screenHorizontalPadding,
            right: screenHorizontalPadding,
            bottom: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: AssetSvg(
                      SvgImages.arrowBackward,
                      height: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Reset your password here',
                style: AppTextStyles.styleWeight400(
                  fontSize: 28,
                  color: const Color(0xFF09051C),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Select which contact details should we use to reset your password',
                style: AppTextStyles.styleWeight500(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              PasswordTextField(
                passwordController: passwordController,
                hasLeadingIcon: false,
              ),
              const SizedBox(height: 12),
              PasswordTextField(
                passwordController: confirmPasswordController,
                hasLeadingIcon: false,
                hintText: 'Confirm Password',
              ),
              const Spacer(),
              RoundedExpandedButton(
                color: Theme.of(context).primaryColor,
                onTap: () {},
                child: Text(
                  'Next',
                  style: AppTextStyles.styleWeight400(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
