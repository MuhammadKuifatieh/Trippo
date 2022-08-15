import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/data/models/places_response.dart';
import '../repositories/profile_repository.dart';

class GetFavoritePlaces
    implements UseCase<PlacesResponse, GetFavoritePlacesParams> {
  final ProfileRepository profileRepository;

  GetFavoritePlaces({required this.profileRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(GetFavoritePlacesParams params) {
    return profileRepository.getFavoritePlaces(params.getParams());
  }
}

class GetFavoritePlacesParams {
  final int page;
  final int perPage;

  GetFavoritePlacesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
