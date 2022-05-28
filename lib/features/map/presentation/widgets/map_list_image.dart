import 'package:flutter/material.dart';
import 'package:trippo/core/widgets/main_rating_bar.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/widgets/scrolling_list_image.dart';

class MapListImage extends StatelessWidget {
  MapListImage({
    Key? key,
  }) : super(key: key);

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
                imageUrls: const [
                  'https://media.istockphoto.com/photos/two-empty-wine-glasses-sitting-in-a-restaurant-on-a-warm-sunny-picture-id1018141890?k=20&m=1018141890&s=612x612&w=0&h=uMDP00MMIhlwQE77EEcoelc2oSKBT_B6avaXqtxgiow=',
                  'https://huawei.ru/upload/iblock/31e/31eaec11dd323da24382d6b16397b968.jpg'
                ],
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.width * .075,
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
                          'Resturant',
                          style: AppTextStyles.styleWeight400(
                            fontSize: size.width * .035,
                          ),
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
                        TrippoIcons.favorite,
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
                      const MainRatingBar(),
                      SizedBox(width: size.width * .02),
                      Text(
                        '56,645',
                        style: AppTextStyles.styleWeight600(
                          color: Colors.grey,
                          fontSize: size.width * .03,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.width * .01),
                  Text(
                    'Syria, Aleppo',
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(height: size.width * .01),
                  Text(
                    'Crown plaza antalya, an IHD hotel room',
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
