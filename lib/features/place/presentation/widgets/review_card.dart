import 'package:flutter/material.dart';
import 'package:trippo/features/place/data/models/reviews_response.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../profile/presentation/pages/profile_screen.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.size,
    required this.review,
  }) : super(key: key);
  final Size size;
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: .5,
                height: .5,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: size.width * .025),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    child: CacheImage(
                      imageUrl: review.user?.image?.url ??
                          'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg',
                      height: size.width * .15,
                      width: size.width * .15,
                      shape: BoxShape.circle,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .025,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .7,
                        child: Text(
                          review.user!.firstName! +
                              " " +
                              review.user!.lastName!,
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .04,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        review.user!.username!,
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .04,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: size.width * .01),
              MainRatingBar(
                isFiter: true,
                filterRating: double.parse(review.rating.toString()),
                circleSize: size.width * .04,
              ),
              SizedBox(height: size.width * .01),
              Text(
                review.tilte!,
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .04,
                ),
              ),
              SizedBox(height: size.width * .01),
              Text(
                intl.DateFormat("yyyy-MM-dd").format(review.createdAt!),
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .04,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: size.width * .01),
              Text(
                review.description!,
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .04,
                ),
              ),
              SizedBox(height: size.width * .025),
              SizedBox(
                width: size.width,
                height: size.width * .5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: review.images!.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .025),
                    child: CacheImage(
                      isPushed: true,
                      width: size.width * .4,
                      height: size.width * .5,
                      hash: review.images![index].hash,
                      imageUrl: review.images![index].url!,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * .035),
              Divider(
                thickness: .5,
                height: .5,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
