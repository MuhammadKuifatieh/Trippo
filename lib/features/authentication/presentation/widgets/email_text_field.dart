import 'package:flutter/material.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailTextFeild extends StatelessWidget {
  const EmailTextFeild({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return AuthTextField(
      controller: emailController,
      hintText: appLocalizations.emailField,
      prefixIcon: const Padding(
        padding: EdgeInsets.all(11.0),
        child: AssetSvg(
          SvgImages.mail,
        ),
      ),
    );
  }
}