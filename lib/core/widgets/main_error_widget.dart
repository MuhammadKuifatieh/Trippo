import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/app_text_styles.dart';
import 'main_button.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    Key? key,
    required this.size,
    required this.onTapRety,
  }) : super(key: key);
  final Size size;
  final VoidCallback onTapRety;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.somethingWrong,
          style: AppTextStyles.styleWeight500(
              color: Theme.of(context).primaryColor,
              fontSize: size.width * .05),
        ),
        SizedBox(height: size.width * .1),
        MainButton(
          child: Text(
            AppLocalizations.of(context)!.retry,
            style: AppTextStyles.styleWeight500(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          height: size.width * .1,
          width: size.width * 2,
          onTap: onTapRety,
        ),
      ],
    );
  }
}
