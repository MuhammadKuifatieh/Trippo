import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/places_response.dart';
import '../repositories/home_repository.dart';

class GetRecentlyViewedPlaces
    implements UseCase<PlacesResponse, GetRecentlyViewedPlacesParams> {
  final HomeRepository homeRepository;

  GetRecentlyViewedPlaces({required this.homeRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetRecentlyViewedPlacesParams params) {
    return homeRepository.getRecentlyViewedPlaces(params.getParams());
  }
}

class GetRecentlyViewedPlacesParams {
  final int page;
  final int perPage;

  GetRecentlyViewedPlacesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
