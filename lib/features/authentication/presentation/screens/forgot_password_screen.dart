import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/design/design_constants.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:trippo/features/authentication/presentation/widgets/email_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
                'Forgot password?',
                style: AppTextStyles.styleWeight400(
                  fontSize: 28,
                  color: const Color(0xFF09051C),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'What’s your email address?',
                style: AppTextStyles.styleWeight600(
                  fontSize: 17,
                  color: const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 12),
              EmailTextFeild(emailController: emailController),
              const Spacer(),
              RoundedExpandedButton(
                color: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                },
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
