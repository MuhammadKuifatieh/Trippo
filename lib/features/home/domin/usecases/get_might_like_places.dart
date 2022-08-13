import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/places_response.dart';
import '../repositories/home_repository.dart';

class GetMightLikePlaces
    implements UseCase<PlacesResponse, GetMightLikePlacesParams> {
  final HomeRepository homeRepository;

  GetMightLikePlaces({required this.homeRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetMightLikePlacesParams params) {
    return homeRepository.getMightLikePlaces(params.getParams());
  }
}

class GetMightLikePlacesParams {
  final int page;
  final int perPage;

  GetMightLikePlacesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
