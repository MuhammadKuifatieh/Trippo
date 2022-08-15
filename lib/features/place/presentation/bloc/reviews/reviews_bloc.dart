import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/reviews_response.dart';
import '../../../data/repositories/place_repository_implement.dart';
import '../../../domin/usecases/get_reviews.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final int perPage = 10;
  final _getReviews = GetReviews(placeRepository: PlaceRepositoryImplement());
  ReviewsBloc() : super(const ReviewsState()) {
    on<GetReviewsEvent>(_mapGetReviewsState);
  }
  FutureOr<void> _mapGetReviewsState(
      GetReviewsEvent event, Emitter<ReviewsState> emit) async {
    if (state.reviewsStatus == ReviewsStatus.init || event.isReload) {
      emit(state.copyWith(reviewsStatus: ReviewsStatus.loading));
      final result = await _getReviews(GetReviewsParams(
        page: 1,
        perPage: perPage,
        placeId: event.placeId,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          reviewsStatus: ReviewsStatus.falied,
        )),
        (r) => emit(state.copyWith(
          isEndPage: r.data!.comments!.length < perPage,
          reviews: r.data!.comments,
          reviewsStatus: ReviewsStatus.succ,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(reviewsStatus: ReviewsStatus.loading));
      final result = await _getReviews(GetReviewsParams(
        page: state.reviews.length ~/ perPage,
        perPage: perPage,
        placeId: event.placeId,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          reviewsStatus: ReviewsStatus.falied,
        )),
        (r) => emit(state.copyWith(
          isEndPage: r.data!.comments!.length < perPage,
          reviews: List.of(state.reviews)..addAll(r.data!.comments!),
          reviewsStatus: ReviewsStatus.succ,
        )),
      );
    }
  }
}
