import 'package:flutter/material.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_text_field.dart';

class EmailTextFeild extends StatelessWidget {
  const EmailTextFeild({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: emailController,
      hintText: 'Username Or Email',
      prefixIcon: const Padding(
        padding: EdgeInsets.all(11.0),
        child: AssetSvg(
          SvgImages.mail,
        ),
      ),
    );
  }
}