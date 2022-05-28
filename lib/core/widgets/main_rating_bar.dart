import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainRatingBar extends StatelessWidget {
  const MainRatingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RatingBar(
      itemSize: size.width * .035,
      itemPadding: EdgeInsetsDirectional.only(
        end: size.width * .005,
      ),
      unratedColor: Theme.of(context).scaffoldBackgroundColor,
      allowHalfRating: true,
      ignoreGestures: false,
      ratingWidget: RatingWidget(
        full: Container(
          width: size.width * .025,
          height: size.width * .025,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        half: Container(
          width: size.width * .025,
          height: size.width * .025,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        empty: Container(
          width: size.width * .025,
          height: size.width * .025,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      onRatingUpdate: (rate) {},
    );
  }
}
