import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:trippo/features/city/data/models/question/question_model.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/cache_image.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final AnswerModel answer;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  CacheImage(
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    imageUrl: testImageUrl,
                    shape: BoxShape.circle,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A7MED SI',
                        style: AppTextStyles.styleWeight500(fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Machester, UK',
                        style: AppTextStyles.styleWeight400(fontSize: 10),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '10 contributers',
                        style: AppTextStyles.styleWeight400(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            answer.text,
            style: AppTextStyles.styleWeight400(),
          ),
          const SizedBox(height: 8),
          Text(
            '24 Aprit 2022',
            style: AppTextStyles.styleWeight300(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
