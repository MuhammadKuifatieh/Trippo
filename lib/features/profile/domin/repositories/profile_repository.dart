import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/places_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, PlacesResponse>> getFavoritePlaces(
      Map<String, dynamic> params);
}
