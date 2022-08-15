import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/reviews_response.dart';
import '../repositories/place_repository.dart';

class GetReviews implements UseCase<ReviewsResponse, GetReviewsParams> {
  final PlaceRepository placeRepository;

  GetReviews({required this.placeRepository});
  @override
  Future<Either<Failure, ReviewsResponse>> call(GetReviewsParams params) async {
    return placeRepository.getReviews(params.getParams());
  }
}

class GetReviewsParams {
  final String? placeId;
  final String? planeId;
  final String? experienceId;
  final int page;
  final int perPage;

  GetReviewsParams({
    this.placeId,
    this.planeId,
    this.experienceId,
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString() ,
        if (placeId != null) "filter[place_id]": placeId,
        if (planeId != null) "filter[plane_id]": planeId,
        if (experienceId != null) "filter[experience_id]": experienceId,
      };
}
