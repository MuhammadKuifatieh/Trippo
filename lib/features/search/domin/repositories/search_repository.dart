import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/home/data/models/places_response.dart';
import 'package:trippo/features/map/data/models/type_respnse.dart';
import 'package:trippo/features/place/data/models/visit_types_response.dart';
import 'package:trippo/features/search/data/models/feature_title_response.dart';

abstract class SearchRepository {
  Future<Either<Failure, TypesResponse>> getTypes();

  Future<Either<Failure, FeatureTitleResponse>> getFeatureTitle();

  Future<Either<Failure, VisitTypesResponse>> getVisitTypes();

  Future<Either<Failure, List<CityModel>>> getCities();
  
  Future<Either<Failure, PlacesResponse>> getPlaces(
      Map<String, dynamic> params);
}
