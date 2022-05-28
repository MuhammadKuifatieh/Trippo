
import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/main_text_field.dart';
import '../pages/place_screen.dart';

class ReviewBottomSheet extends StatelessWidget {
  const ReviewBottomSheet({
    Key? key,
    required this.size,
    required this.selectedTypeRatting,
    required this.typeRatting,
  }) : super(key: key);

  final Size size;
  final ValueNotifier<String?> selectedTypeRatting;
  final List<String> typeRatting;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.width * .025,
                bottom: size.width * .05,
              ),
              child: Container(
                width: size.width * .225,
                height: 3,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Text(
            "How would you rate your experience?",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          MainRatingBar(
            circleSize: size.width * .075,
          ),
          SizedBox(height: size.width * .05),
          Text(
            "Whats Kind of visited was this?",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          ValueListenableBuilder<String?>(
              valueListenable: selectedTypeRatting,
              builder: (context, selectedValue, _) {
                return Wrap(
                  children: typeRatting
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: MainButton(
                                child: Text(
                                  e,
                                  style: AppTextStyles.styleWeight400(
                                    fontSize: size.width * .04,
                                    color: selectedValue != e
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                                height: size.width * .1,
                                width: size.width * .25,
                                color: selectedValue == e
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                border: selectedValue == e
                                    ? null
                                    : BorderSide(
                                        color: Theme.of(context).primaryColor),
                                onTap: () {
                                  selectedTypeRatting.value = e;
                                }),
                          ))
                      .toList(),
                );
              }),
          SizedBox(height: size.width * .05),
          Text(
            "When did you visit ?",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          MainButton(
            child: Text(
              "4 May 2022",
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
                color: Theme.of(context).primaryColor,
              ),
            ),
            height: size.width * .1,
            width: size.width * .25,
            color: Colors.white,
            border: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {},
          ),
          SizedBox(height: size.width * .05),
          Text(
            "Write your review",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          MainTextField(
            controller: TextEditingController(),
            maxLines: 4,
          ),
          SizedBox(height: size.width * .05),
          Text(
            "Title this review",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          MainTextField(
            controller: TextEditingController(),
            maxLines: 2,
          ),
          SizedBox(height: size.width * .05),
          Text(
            "Share some photos from your visit",
            style: AppTextStyles.styleWeight600(
              fontSize: size.width * .04,
            ),
          ),
          SizedBox(height: size.width * .025),
          MainButton(
            child: Icon(Icons.camera_alt_outlined),
            height: size.width * .1,
            width: size.width * .25,
            color: Colors.white,
            border:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
            onTap: () {},
          ),
          SizedBox(height: size.width * .075),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MainButton(
                child: Text(
                  'cancel',
                  style: AppTextStyles.styleWeight400(
                    fontSize: size.width * .04,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                height: size.width * .1,
                width: size.width * .25,
                color: Colors.white,
                border: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.5),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MainButton(
                child: Text(
                  'Submit',
                  style: AppTextStyles.styleWeight400(
                    fontSize: size.width * .04,
                    color: Colors.white,
                  ),
                ),
                height: size.width * .1,
                width: size.width * .25,
                color: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: size.width * .05),
        ],
      ),
    );
  }
}
