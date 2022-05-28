import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../profile/presentation/pages/profile_screen.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

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
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWlKVGJeILLo6n3_-9GgvdvWyz7MJbC1o7g&usqp=CAU',
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
                      Text(
                        'Mark Z',
                        style: AppTextStyles.styleWeight600(
                          fontSize: size.width * .04,
                        ),
                      ),
                      Text(
                        '2 contribution',
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .04,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: size.width * .01),
              MainRatingBar(circleSize: size.width * .04),
              Text(
                'Not a 4 Start . Look for something that`s creditable. False advertising dump .',
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .04,
                ),
              ),
              SizedBox(height: size.width * .01),
              Text(
                '20/01/2022',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .04,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: size.width * .01),
              Text(
                'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
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
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .025),
                    child: CacheImage(
                      width: size.width * .4,
                      height: size.width * .5,
                      borderRadius: BorderRadius.circular(15),
                      imageUrl:
                          'https://st2.depositphotos.com/2576711/8499/i/950/depositphotos_84995726-stock-photo-dramatic-sunset-over-uttakleiv-beach.jpg',
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
