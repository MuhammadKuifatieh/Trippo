import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

class GetCityUseCase implements UseCase<CityModel, GetCityParams> {
  final CityRepository _getCityRepository;

  GetCityUseCase({required CityRepository getCityRepository})
      : _getCityRepository = getCityRepository;

  @override
  Future<Either<Failure, CityModel>> call(GetCityParams params) async {
    return await _getCityRepository.getCityById(params: params.getParamsMap());
  }
}

class GetCityParams {
  final int id;

  GetCityParams({required this.id});

  Map<String, dynamic> getParamsMap() {
    return {
      "id": id.toString(),
    };
  }
}
