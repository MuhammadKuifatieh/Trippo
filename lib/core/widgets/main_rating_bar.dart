import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainRatingBar extends StatelessWidget {
  const MainRatingBar({
    Key? key,
    this.circleSize,
  }) : super(key: key);
  final double? circleSize;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RatingBar(
      itemSize:circleSize?? size.width * .035,
      itemPadding: EdgeInsetsDirectional.only(
        end: size.width * .005,
      ),
      unratedColor: Theme.of(context).scaffoldBackgroundColor,
      allowHalfRating: true,
      ignoreGestures: false,
      ratingWidget: RatingWidget(
        full: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        half: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        empty: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
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
