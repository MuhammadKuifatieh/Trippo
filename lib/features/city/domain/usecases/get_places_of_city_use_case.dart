import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

class GetPlacesOfCityUseCase
    implements UseCase<List<PlaceModel>, GetPlacesOfCityParams> {
  final CityRepository getCityRepository;

  GetPlacesOfCityUseCase({required this.getCityRepository});

  @override
  Future<Either<Failure, List<PlaceModel>>> call(
      GetPlacesOfCityParams params) async {
    return await getCityRepository.getPlacesOfCity(
        params: params);
  }
}

class GetPlacesOfCityParams {
  final int cityId;

  GetPlacesOfCityParams({required this.cityId});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": cityId.toString(),
    };
  }
}
