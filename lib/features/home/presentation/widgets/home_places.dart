import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../data/models/places_response.dart';

import '../../../place/presentation/pages/place_screen.dart';

class HomePlaces extends StatelessWidget {
  const HomePlaces({
    Key? key,
    required this.size,
    required this.title,
    required this.places,
    required this.isFailed,
    required this.onTapRety,
    required this.isLoading,
    required this.onPop,
    this.description,
  }) : super(key: key);

  final Size size;
  final String title;
  final String? description;
  final List<PlaceModel> places;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRety;
  final void Function(bool, int) onPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.styleWeight600(
            fontSize: size.width * .06,
          ),
        ),
        if (description != null)
          Text(
            description!,
            style: AppTextStyles.styleWeight400(
              fontSize: size.width * .04,
            ),
          ),
        SizedBox(height: size.width * .025),
        SizedBox(
          height: size.width * .625,
          child: isLoading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade400,
                      child: SizedBox(
                        width: size.width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .65,
                              height: size.width * .4,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(height: size.width * .025),
                            Container(
                              color: Colors.grey,
                              width: size.width * .4,
                              height: 5,
                            ),
                            SizedBox(height: size.width * .01),
                            Container(
                              color: Colors.grey,
                              width: size.width * .3,
                              height: 5,
                            ),
                            SizedBox(height: size.width * .01),
                            Container(
                              color: Colors.grey,
                              width: size.width * .4,
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : isFailed
                  ? MainErrorWidget(
                      size: size,
                      onTapRety: onTapRety,
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: places.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: SizedBox(
                          width: size.width * .6,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(
                                PlaceScreen.routeName,
                                arguments: PlaceScreenParams(
                                  id: places[index].id.toString(),
                                ),
                              )
                                  .then((value) {
                                bool favoriteValue = value as bool;
                                onPop(favoriteValue, index);
                              });
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CacheImage(
                                      imageUrl: places[index].images![0].url!,
                                      hash: places[index].images![0].hash!,
                                      width: size.width * .65,
                                      height: size.width * .4,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.all(size.width * .025),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Spacer(),
                                          Container(
                                            width: size.width * .1,
                                            height: size.width * .1,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.black.withOpacity(.6),
                                            ),
                                            child: Icon(
                                              places[index].isFavorite!
                                                  ? TrippoIcons.favorite
                                                  : TrippoIcons.favorite_border,
                                              color:
                                                  Theme.of(context).errorColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.width * .025),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      places[index].name!,
                                      style: AppTextStyles.styleWeight400(
                                        fontSize: size.width * .0375,
                                      ),
                                    ),
                                    SizedBox(height: size.width * .01),
                                    Row(
                                      children: [
                                        MainRatingBar(
                                          isFiter: true,
                                          filterRating: double.parse(
                                            places[index].ratting!.toString(),
                                          ),
                                        ),
                                        SizedBox(width: size.width * .02),
                                        Text(
                                          places[index].rattingCount.toString(),
                                          style: AppTextStyles.styleWeight600(
                                            color: Colors.grey,
                                            fontSize: size.width * .03,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: size.width * .01),
                                    Text(
                                      places[index].cityName!,
                                      style: AppTextStyles.styleWeight500(
                                        fontSize: size.width * .04,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
      ],
    );
  }
}
