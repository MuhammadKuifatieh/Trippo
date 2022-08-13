import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/no_response.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/place_response.dart';

abstract class PlaceRepository {
  Future<Either<Failure, PlaceResponse>> getPlace(String id);
  Future<Either<Failure, PlacesResponse>> getNearbyPlaces(String id);
  Future<Either<Failure, NoResponse>> changeFavoriteState(String id);
  Future<Either<Failure, NoResponse>> uploadImagePlace({
    required String id,
    required Map<String, dynamic> body,
  });
}
