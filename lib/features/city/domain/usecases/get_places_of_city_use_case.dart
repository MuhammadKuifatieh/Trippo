import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';

class GetPlacesOfCityUseCase implements UseCase<List<PlaceOfCityModel>, GetPlacesOfCityParams> {
  final GetCityRepository _getCityRepository;

  GetPlacesOfCityUseCase({required GetCityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, List<PlaceOfCityModel>>> call(GetPlacesOfCityParams params) async {
    return await _getCityRepository.getPlacesOfCity(params: params.getParamsMap());
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
