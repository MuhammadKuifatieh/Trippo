import 'package:flutter/material.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: passwordController,
      hintText: 'Password',
      prefixIcon: const Padding(
        padding: EdgeInsets.all(11.0),
        child: AssetSvg(
          SvgImages.openedLock,
        ),
      ),
    );
  }
}