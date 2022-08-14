import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/city/data/datasources/get_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_places_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

class GetCityRepositoryImpl
    with HandlingExceptionManager
    implements GetCityRepository {
  final GetCityRemoteDataSource _getCityRemoteDataSource;
  final GetPlacesOfCityRemoteDataSource _getPlacesOfCityRemoteDataSource;


  GetCityRepositoryImpl({
    required GetCityRemoteDataSource getCityRemoteDataSource,
    required GetPlacesOfCityRemoteDataSource getPlacesOfCityRemoteDataSource,
    
   
        getThingsToDoCityRemoteDataSource,
  })  : _getCityRemoteDataSource = getCityRemoteDataSource,
        _getPlacesOfCityRemoteDataSource = getPlacesOfCityRemoteDataSource;
      
  @override
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params}) async {
    return await wrapHandling(tryCall: () async {
      final city = await _getCityRemoteDataSource.getCity(params: params);
      return Right(city);
    });
  }

  @override
  Future<Either<Failure, List<PlaceOfCityModel>>> getPlacesOfCity(
      {required Map<String, dynamic> params})async {
    return await wrapHandling(tryCall: () async {
      final places = await _getPlacesOfCityRemoteDataSource.getPlacesOfCity(params: params);
      return Right(places);
    });
  }

 
  
}
