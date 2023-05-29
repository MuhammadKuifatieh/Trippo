import 'package:dartz/dartz.dart';
import 'package:trippo/features/home/data/datasources/all_cities_data_source.dart';
import 'package:trippo/features/home/data/datasources/remote_get_top_attraction_places_data_source.dart';
import 'package:trippo/features/home/data/datasources/remote_get_might_like_places_data_source.dart';
import 'package:trippo/features/home/data/datasources/remote_get_small_batch_places_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domin/repositories/home_repository.dart';
import '../datasources/remote_get_recently_viewed_places_data_source.dart';
import '../datasources/remote_get_trending_cities_data_source.dart';
import '../models/cities_response.dart';
import '../models/places_response.dart';

class HomeRepositoryImplement
    with HandlingExceptionManager
    implements HomeRepository {
  final _getTrendingCities = RemoteGetTrendingCitiesDataSource();
  final _getRecentlyViewedPlaces = RemoteGetRecentlyViewedPlacesDataSource();
  final _getTopAttraction = RemoteGetTopAttractionPlacesDataSource();
  final _getMightLikePlaces = RemoteGetMightLikePlacesDataSource();
  final _getSmallBatchPlaces = RemoteGetSmallBatchPlacesDataSource();
  final _allCitiesDataSource = AllCitiesDataSource();

  @override
  Future<Either<Failure, CitiesResponse>> getTrendingCities(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getTrendingCities.getTrending(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getRecentlyViewedPlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result =
          await _getRecentlyViewedPlaces.getRecentlyViewedPlaces(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getMightLikePlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getMightLikePlaces.getMightLikePlaces(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getSmallBatchPlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getSmallBatchPlaces.getSmallBatchPlaces(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getTopAttracyionPlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getTopAttraction.getTopAttractionPlaces(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, List<CityModel>>> getAllCities(
      Map<String, dynamic> parmas) {
    return wrapHandling<List<CityModel>>(tryCall: () async {
      final result = await _allCitiesDataSource.getAllCities(parmas);
      return Right(result);
    });
  }
}
