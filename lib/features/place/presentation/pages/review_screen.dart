import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../widgets/review_card.dart';
import '../widgets/review_result_card.dart';

class ReviewsScreen extends StatefulWidget {
  static const String routeName = 'reviews_screen';
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Very Beutiful Home',
          style: AppTextStyles.styleWeight600(
            color: Theme.of(context).primaryColor,
            fontSize: size.width * .045,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: EdgeInsets.all(size.width * .04),
                        child: Column(
                          children: [
                            Text(
                              'Reviews',
                              style: AppTextStyles.styleWeight700(
                                fontSize: size.width * .075,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    '3.5',
                                    style: AppTextStyles.styleWeight700(
                                        fontSize: size.width * .09,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  SizedBox(height: size.width * .015),
                                  MainRatingBar(circleSize: size.width * .06),
                                  SizedBox(height: size.width * .015),
                                  Text(
                                    '375 reviews',
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .045,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.width * .05),
                            ReviewResultCard(size: size),
                            SizedBox(height: size.width * .05),
                          ],
                        ),
                      )
                    : ReviewCard(size: size);
              },
            ),
          )
        ],
      ),
    );
  }
}
