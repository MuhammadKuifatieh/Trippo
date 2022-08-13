import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/data/models/places_response.dart';
import '../repositories/place_repository.dart';

class GetNearbyPlaces
    implements UseCase<PlacesResponse, GetNearbyPlacesParams> {
  final PlaceRepository placeRepository;

  GetNearbyPlaces({required this.placeRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetNearbyPlacesParams params) async {
    return placeRepository.getNearbyPlaces(params.id);
  }
}

class GetNearbyPlacesParams {
  final String id;

  GetNearbyPlacesParams({
    required this.id,
  });
}
