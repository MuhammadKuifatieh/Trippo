import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:trippo/features/place/data/models/reviews_response.dart';

import '../../../../core/config/app_text_styles.dart';

class ReviewResultCard extends StatelessWidget {
  const ReviewResultCard({
    Key? key,
    required this.size,
    required this.ratting,
  }) : super(key: key);

  final Size size;
  final List<RattingModel> ratting;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: size.width * .325,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              ratting.length - 1,
              (index) => Text(
                ratting[index + 1].name!,
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
            ).toList(),
            //   Text(
            //     '${AppLocalizations.of(context)!.solo} :',
            //     style: AppTextStyles.styleWeight400(
            //       fontSize: size.width * .045,
            //     ),
            //   ),
            //   Text(
            //     '${AppLocalizations.of(context)!.business} :',
            //     style: AppTextStyles.styleWeight400(
            //       fontSize: size.width * .045,
            //     ),
            //   ),
            //   Text(
            //     '${AppLocalizations.of(context)!.frinds} :',
            //     style: AppTextStyles.styleWeight400(
            //       fontSize: size.width * .045,
            //     ),
            //   ),
            // ],
          ),
        ),
        SizedBox(width: size.width * .025),
        SizedBox(
          height: size.width * .325,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              ratting.length - 1,
              (index) => ReviewBar(
                size: size,
                value: ratting[index].count!,
                statusBarWidth: size.width *
                    (ratting[index].count! / ratting[0].count!) *
                    .4,
              ),
            ).toList(),

            // ReviewBar(
            //   size: size,
            //   value: 45,
            //   statusBarWidth: size.width * .375,
            // ),
            // ReviewBar(
            //   size: size,
            //   value: 55,
            //   statusBarWidth: size.width * .44,
            // ),
            // ReviewBar(
            //   size: size,
            //   value: 63,
            //   statusBarWidth: size.width * .55,
            // ),
          ),
        ),
      ],
    );
  }
}

class ReviewBar extends StatelessWidget {
  const ReviewBar({
    Key? key,
    required this.size,
    required this.value,
    required this.statusBarWidth,
  }) : super(key: key);

  final Size size;
  final int value;
  final double statusBarWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: statusBarWidth,
          height: size.width * .025,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(width: size.width * .025),
        Text(
          value.toString(),
          style: AppTextStyles.styleWeight400(
            fontSize: size.width * .03,
          ),
        ),
      ],
    );
  }
}
