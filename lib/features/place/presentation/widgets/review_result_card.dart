import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../pages/place_screen.dart';

class ReviewResultCard extends StatelessWidget {
  const ReviewResultCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: size.width * .325,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exellent :',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
              Text(
                'Very good :',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
              Text(
                'Average :',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
              Text(
                'Poor :',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
              Text(
                'Terrible :',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .045,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: size.width * .05),
        SizedBox(
          height: size.width * .325,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReviewBar(
                size: size,
                value: 33,
                statusBarWidth: size.width * .3,
              ),
              ReviewBar(
                size: size,
                value: 45,
                statusBarWidth: size.width * .375,
              ),
              ReviewBar(
                size: size,
                value: 55,
                statusBarWidth: size.width * .44,
              ),
              ReviewBar(
                size: size,
                value: 63,
                statusBarWidth: size.width * .55,
              ),
              ReviewBar(
                size: size,
                value: 23,
                statusBarWidth: size.width * .23,
              ),
            ],
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
