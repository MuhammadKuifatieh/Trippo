part of 'reviews_bloc.dart';

abstract class ReviewsEvent {
  const ReviewsEvent();
}

class GetReviewsEvent extends ReviewsEvent {
  final String? placeId;
  final bool isReload;

  GetReviewsEvent({
    this.placeId,
    this.isReload = false,
  });
}
