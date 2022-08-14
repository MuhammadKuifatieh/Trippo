import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

abstract class GetCityRepository {
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<PlaceOfCityModel>>> getPlacesOfCity(
      {required Map<String, dynamic> params});
  
}
