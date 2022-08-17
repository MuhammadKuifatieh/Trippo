import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/scrolling_list_image.dart';
import '../../../home/data/models/places_response.dart';
import '../../../place/presentation/pages/place_screen.dart';

class MapListImage extends StatelessWidget {
  MapListImage({
    Key? key,
    required this.place,
  }) : super(key: key);
  final PlaceModel place;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * .05),
      child: Column(
        children: [
          Stack(
            children: [
              ScrollingListImage(
                size: size,
                height: size.width * .6,
                width: size.width * .9,
                images: place.images!,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.width * .075,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(5),
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
                          style: AppTextStyles.styleWeight400(
                            fontSize: size.width * .035,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * .1,
                      height: size.width * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.6),
                      ),
                      child: Icon(
                        place.isFavorite!
                            ? TrippoIcons.favorite
                            : TrippoIcons.favorite_border,
                        color: Theme.of(context).errorColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * .025),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          fontSize: size.width * .03,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.width * .01),
                  Text(
                    place.cityName!,
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(height: size.width * .01),
                  Text(
                    place.name!,
                    style: AppTextStyles.styleWeight300(
                      fontSize: size.width * .04,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
