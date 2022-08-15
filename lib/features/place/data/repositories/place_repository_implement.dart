import 'package:dartz/dartz.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../home/data/models/places_response.dart';
import '../../domin/repositories/place_repository.dart';
import '../datasources/remote_add_review_to_place_data_source.dart';
import '../datasources/remote_change_favorite_state_data_source.dart';
import '../datasources/remote_get_nearby_place_data_source.dart';
import '../datasources/remote_get_place_data_source.dart';
import '../datasources/remote_get_place_images_data_source.dart';
import '../datasources/remote_get_reviews_data_source.dart';
import '../datasources/remote_get_visit_types_data_source.dart';
import '../datasources/remote_upload_image_place_data_source.dart';
import '../models/add_reviwe_response.dart';
import '../models/images_reponse.dart';
import '../models/place_response.dart';
import '../models/reviews_response.dart';
import '../models/visit_types_response.dart';

class PlaceRepositoryImplement
    with HandlingExceptionManager
    implements PlaceRepository {
  final _getPlace = RemoteGetPlaceDataSource();
  final _getReviews = RemoteGetReviewsDataSource();
  final _getVisitTypes = RemoteGetVisitTypesDataSource();
  final _getPlaceImages = RemoteGetPlaceImagesDataSource();
  final _getNearbyPlaces = RemoteGetNearbyPlacesDataSource();
  final _addReviewToPlace = RemoteAddReviewToPlaceDataSource();
  final _uploadImagePlace = RemoteUploadImagePlaceDataSource();
  final _changeFavoriteState = RemoteChangeFavoriteStateDataSource();

  @override
  Future<Either<Failure, PlaceResponse>> getPlace(String id) async {
    return wrapHandling(tryCall: () async {
      final result = await _getPlace.getPlace(id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getNearbyPlaces(String id) async {
    return wrapHandling(tryCall: () async {
      final result = await _getNearbyPlaces.getNearbyPlaces(id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> uploadImagePlace({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    return wrapHandling(tryCall: () async {
      final result =
          await _uploadImagePlace.uploadImagePlace(id: id, body: body);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> changeFavoriteState(String id) async {
    return wrapHandling(tryCall: () async {
      final result = await _changeFavoriteState.changeFavoriteState(id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, ImagesResponse>> getPlaceImages(
      {required String id, required Map<String, dynamic> params}) {
    return wrapHandling(tryCall: () async {
      final result =
          await _getPlaceImages.getPlaceImages(id: id, params: params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, AddReviewResponse>> addReviewToPlace(
      {required String id, required Map<String, dynamic> body}) async {
    return wrapHandling(tryCall: () async {
      final result =
          await _addReviewToPlace.addReviewToPlace(id: id, body: body);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, VisitTypesResponse>> getVisitTypes() async {
    return wrapHandling(tryCall: () async {
      final result = await _getVisitTypes.getVisitTypes();
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, ReviewsResponse>> getReviews(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getReviews.getReviews(params);
      return Right(result);
    });
  }
}
