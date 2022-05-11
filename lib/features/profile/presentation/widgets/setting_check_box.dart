import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';

class SettingCheckBox extends StatelessWidget {
  const SettingCheckBox({
    Key? key,
    required this.size,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final Size size;
  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(true);
      },
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: size.width * .2,
          child: Card(
            child: Row(
              children: [
                Checkbox(
                  value: value,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: onChanged,
                ),
                Text(
                  title,
                  style: AppTextStyles.styleWeight400(
                    fontSize: size.width * .035,
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
