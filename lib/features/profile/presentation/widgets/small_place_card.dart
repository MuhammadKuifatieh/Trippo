
import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../home/data/models/places_response.dart';

class SmallPlaceCard extends StatelessWidget {
  const SmallPlaceCard({
    Key? key,
    required this.place,
    required this.size,
  }) : super(key: key);
  final PlaceModel place;
  final Size size;

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          CacheImage(
            imageUrl: place.images![0].url!,
            hash: place.images![0].hash,
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
                place.name!,
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .04,
                ),
              ),
              SizedBox(
                width: size.width * .4,
                child: Text(
                  place.about!,
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
                    filterRating: double.parse(place.ratting.toString()),
                  ),
                  SizedBox(width: size.width * .02),
                  Text(
                    place.rattingCount.toString(),
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
                        place.cityName!,
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
                          place.typeName!,
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
    );
  }
}
