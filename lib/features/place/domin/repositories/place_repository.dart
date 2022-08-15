import 'package:dartz/dartz.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/models/places_response.dart';
import '../../data/models/add_reviwe_response.dart';
import '../../data/models/images_reponse.dart';
import '../../data/models/place_response.dart';
import '../../data/models/reviews_response.dart';
import '../../data/models/visit_types_response.dart';

abstract class PlaceRepository {
  Future<Either<Failure, PlaceResponse>> getPlace(String id);
  Future<Either<Failure, PlacesResponse>> getNearbyPlaces(String id);
  Future<Either<Failure, NoResponse>> changeFavoriteState(String id);
  Future<Either<Failure, ImagesResponse>> getPlaceImages({
    required String id,
    required Map<String, dynamic> params,
  });
  Future<Either<Failure, NoResponse>> uploadImagePlace({
    required String id,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, AddReviewResponse>> addReviewToPlace({
    required String id,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, VisitTypesResponse>> getVisitTypes();

  Future<Either<Failure, ReviewsResponse>> getReviews(
      Map<String, dynamic> params);
}
