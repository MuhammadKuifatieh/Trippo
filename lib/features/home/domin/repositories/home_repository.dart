import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, CitiesResponse>> getTrendingCities(
      Map<String, dynamic> parmas);

  Future<Either<Failure, List<CityModel>>> getAllCities(
      Map<String, dynamic> parmas);

  Future<Either<Failure, PlacesResponse>> getRecentlyViewedPlaces(
      Map<String, dynamic> params);

  Future<Either<Failure, PlacesResponse>> getMightLikePlaces(
      Map<String, dynamic> params);

  Future<Either<Failure, PlacesResponse>> getSmallBatchPlaces(
      Map<String, dynamic> params);

  Future<Either<Failure, PlacesResponse>> getTopAttracyionPlaces(
      Map<String, dynamic> params);
}
