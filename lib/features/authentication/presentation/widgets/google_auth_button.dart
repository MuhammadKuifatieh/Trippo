import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedExpandedButton(
      elevation: 2,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AssetSvg(SvgImages.google),
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
    );
  }
}
