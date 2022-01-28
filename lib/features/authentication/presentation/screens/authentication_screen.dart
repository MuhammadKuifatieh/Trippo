import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/widget/rounded_expanded_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const routeName = '/authentication';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.36,
                  height: screenWidth * 0.36,
                  child: Placeholder(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.08),
                SizedBox(
                  width: screenWidth * 0.51,
                  child: Text(
                    'Discover new places and find new adventures.',
                    style: AppTextStyles.styleWeight500(
                      color: const Color(0xff666666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.08),
                Text(
                  'Login To Your Account',
                  style: AppTextStyles.styleWeight300(
                    fontSize: 28,
                    color: const Color(0xff09051C),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  width: screenWidth * 0.67,
                  child: Text(
                    'Before enjoying Trippo services Please register first',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleWeight400(
                      fontSize: 15,
                      color: const Color(0xff999999),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                RoundedExpandedButton(
                  elevation: 2,
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: const Placeholder(color: Colors.red),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Google',
                        style: AppTextStyles.styleWeight400(
                          fontSize: 14,
                          color: const Color(0xff09051C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                RoundedExpandedButton(
                  elevation: 2,
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: const Placeholder(color: Colors.blue),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Facebook',
                        style: AppTextStyles.styleWeight400(
                          fontSize: 14,
                          color: const Color(0xff09051C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
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
                SizedBox(height: screenHeight * 0.02),
                RoundedExpandedButton(
                  color: const Color(0xffE0F4E8),
                  child: Text(
                    'Create Account',
                    style: AppTextStyles.styleWeight400(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
