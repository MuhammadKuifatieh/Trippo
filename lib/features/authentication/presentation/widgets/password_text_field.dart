import 'package:flutter/material.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_text_field.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    Key? key,
    required this.passwordController,
    this.hasLeadingIcon = true,
    this.hintText = 'Password'
  }) : super(key: key);

  final TextEditingController passwordController;
  final bool hasLeadingIcon;
  final ValueNotifier<bool> isVisible = ValueNotifier(false);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isVisible,
      builder: (BuildContext context, bool value, _) {
        return AuthTextField(
          controller: passwordController,
          obscureText: !value,
          hintText: hintText,
          prefixIcon: hasLeadingIcon
              ? const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: AssetSvg(
                    SvgImages.openedLock,
                  ),
                )
              : null,
          suffixIcon: InkWell(
            onTap: () {
              isVisible.value = !value;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AssetSvg(
                SvgImages.eye,
                color: value
                    ? Theme.of(context).primaryColor
                    : const Color(0xFF666666),
              ),
            ),
          ),
        );
      },
    );
  }
}
