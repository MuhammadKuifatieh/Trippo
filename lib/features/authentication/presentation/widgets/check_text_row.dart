import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';

class CheckTextRow extends StatelessWidget {
  const CheckTextRow({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);
  final bool value;
  final void Function(bool?)? onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: true,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(
          text,
          style: AppTextStyles.styleWeight400(),
        ),
      ],
    );
  }
}
