part of 'reviews_bloc.dart';

enum ReviewsStatus { init, succ, loading, falied }

class ReviewsState {
  final ReviewsStatus reviewsStatus;
  final List<ReviewModel> reviews;
  final List<RattingModel> ratting;
  final bool isEndPage;
  const ReviewsState({
    this.isEndPage = false,
    this.reviews = const [],
    this.ratting = const [],
    this.reviewsStatus = ReviewsStatus.init,
  });
  ReviewsState copyWith({
    bool? isEndPage,
    ReviewsStatus? reviewsStatus,
    List<ReviewModel>? reviews,
    List<RattingModel>? ratting,
  }) {
    return ReviewsState(
      ratting: ratting ?? this.ratting,
      reviews: reviews ?? this.reviews,
      isEndPage: isEndPage ?? this.isEndPage,
      reviewsStatus: reviewsStatus ?? this.reviewsStatus,
    );
  }
}
