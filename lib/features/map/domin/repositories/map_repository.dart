import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/places_response.dart';
import '../../data/models/type_respnse.dart';

abstract class MapRepository {
  Future<Either<Failure, TypesResponse>> getTypes();

  Future<Either<Failure, PlacesResponse>> getPlacesToMap(
      Map<String, dynamic> params);
}
