import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/cities_response.dart';
import '../repositories/home_repository.dart';

class GetAllCitiesUseCase implements UseCase<List<CityModel>, GetAllCitiesParams> {
  final HomeRepository homeRepository;

  GetAllCitiesUseCase(this.homeRepository);
  @override
  Future<Either<Failure, List<CityModel>>> call(GetAllCitiesParams params) {
    return homeRepository.getAllCities(params.getParams());
  }
}

class GetAllCitiesParams {
  final int page;
  final int perPage;
  GetAllCitiesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "perPage": perPage.toString(),
        "page": page.toString(),
      };
}
