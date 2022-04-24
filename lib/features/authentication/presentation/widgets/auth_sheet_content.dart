import 'package:flutter/material.dart';
import 'package:trippo/features/authentication/presentation/widgets/signup_page.dart';

import 'login_page.dart';

class AuthSheetContent extends StatefulWidget {
  const AuthSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthSheetContent> createState() => _AuthSheetContentState();
}

class _AuthSheetContentState extends State<AuthSheetContent> {
  late PageController _pageController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.only(top: 6),
            width: 60,
            height: 5,
          ),
          const SizedBox(height: 25),
          const SizedBox(
            width: 300,
            height: 60,
            child: Placeholder(),
          ),
          const SizedBox(height: 65),
          SizedBox(
            height: 400,
            child: PageView(
              controller: _pageController,
              children: [
                LoginPage(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                SignupPage(
                  emailController: emailController,
                  nameController: nameController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
