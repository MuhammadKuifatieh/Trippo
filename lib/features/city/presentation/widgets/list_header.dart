import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key? key,
    required this.title,
    required this.description,
    this.seeAllHandler,
  }) : super(key: key);

  final String title;
  final String description;
  final void Function()? seeAllHandler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.styleWeight600(fontSize: 24),
              ),
              InkWell(
                onTap: seeAllHandler,
                child: Text(
                  'عرض الكل',
                  style: AppTextStyles.styleWeight500(fontSize: 16)
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyles.styleWeight400(fontSize: 14)
                .copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}
