import 'package:flutter/material.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';

class PlanContentCard extends StatelessWidget {
  const PlanContentCard({
    Key? key,
    required this.planContent,
  }) : super(key: key);

  final PlanContentModel planContent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(size.width * .025),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CacheImage(
                imageUrl: planContent.place.images![0].url!,
                hash: planContent.place.images![0].hash!,
                width: size.width * .4,
                height: size.width * .4,
                borderRadius: const BorderRadiusDirectional.horizontal(
                  start: Radius.circular(15),
                ),
              ),
              SizedBox(
                width: size.width * .025,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planContent.place.name!,
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .4,
                    child: Text(
                      planContent.place.about!,
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .04,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: size.width * .05),
                  Row(
                    children: [
                      MainRatingBar(
                        isFiter: true,
                        filterRating:
                            double.parse(planContent.place.ratting.toString()),
                      ),
                      SizedBox(width: size.width * .02),
                      Text(
                        planContent.place.rattingCount.toString(),
                        style: AppTextStyles.styleWeight600(
                          color: Colors.grey,
                          fontSize: size.width * .0275,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            planContent.place.cityName!,
                            style: AppTextStyles.styleWeight400(
                              fontSize: size.width * .035,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: size.width * .2,
                          height: size.width * .06,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1.5,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              planContent.place.typeName!,
                              style: AppTextStyles.styleWeight600(
                                fontSize: size.width * .025,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            planContent.fullDate!,
            style: AppTextStyles.styleWeight500(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            planContent.comment!,
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .05,
            ),
          ),
        ],
      ),
    );
  }
}
