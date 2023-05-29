import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.filterName,
    required this.widgets,
  }) : super(key: key);
  final String filterName;
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filterName,
          style: AppTextStyles.styleWeight500(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: Wrap(
            spacing: 10,
            children: widgets,
          ),
        ),
      ],
    );
  }
}
