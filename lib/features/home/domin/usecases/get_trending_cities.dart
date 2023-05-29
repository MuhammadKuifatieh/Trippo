import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/cities_response.dart';
import '../repositories/home_repository.dart';

class GetTrendingCities
    implements UseCase<CitiesResponse, GetTrendingCitiesParams> {
  final HomeRepository homeRepository;

  GetTrendingCities(this.homeRepository);
  @override
  Future<Either<Failure, CitiesResponse>> call(GetTrendingCitiesParams params) {
    return homeRepository.getTrendingCities(params.getParams());
  }
}

class GetTrendingCitiesParams {
  final int page;
  final int perPage;
  GetTrendingCitiesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "perPage": perPage.toString(),
        "page": page.toString(),
      };
}
