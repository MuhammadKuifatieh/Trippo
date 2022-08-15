import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../bloc/reviews/reviews_bloc.dart';
import '../widgets/review_card.dart';
import '../widgets/review_result_card.dart';

class ReviewsScreen extends StatefulWidget {
  static const String routeName = 'reviews_screen';
  const ReviewsScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final ReviewsScreenParams arg;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late Size size;
  late ReviewsBloc reviewsBloc;
  @override
  void initState() {
    reviewsBloc = ReviewsBloc()
      ..add(GetReviewsEvent(
        placeId: widget.arg.placeId,
      ));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reviewsBloc,
      child: BlocConsumer<ReviewsBloc, ReviewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.arg.name,
                style: AppTextStyles.styleWeight600(
                  color: Theme.of(context).primaryColor,
                  fontSize: size.width * .045,
                ),
              ),
              centerTitle: true,
            ),
            body: state.reviewsStatus == ReviewsStatus.loading &&
                    state.reviews.isEmpty
                ? SizedBox(
                    height: size.height * .6,
                    child: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Theme.of(context).primaryColor,
                        size: size.width * .1,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            reviewsBloc.add(GetReviewsEvent(
                              isReload: true,
                              placeId: widget.arg.placeId,
                            ));
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.reviews.length +
                                1 +
                                (state.isEndPage ? 0 : 1),
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
                                                  style: AppTextStyles
                                                      .styleWeight700(
                                                          fontSize:
                                                              size.width * .09,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                ),
                                                SizedBox(
                                                    height: size.width * .015),
                                                MainRatingBar(
                                                    circleSize:
                                                        size.width * .06),
                                                SizedBox(
                                                    height: size.width * .015),
                                                Text(
                                                  '375 reviews',
                                                  style: AppTextStyles
                                                      .styleWeight400(
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
                                  : index == state.reviews.length + 1
                                      ? Center(
                                          child: LoadingAnimationWidget
                                              .threeArchedCircle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: size.width * .05,
                                          ),
                                        )
                                      : ReviewCard(
                                          size: size,
                                          review: state.reviews[index - 1],
                                        );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class ReviewsScreenParams {
  final String? placeId;
  final String name;

  ReviewsScreenParams({
    this.placeId,
    required this.name,
  });
}
