import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/search/domin/repositories/search_repository.dart';

class GetAllCitiesToSearch implements UseCase<List<CityModel>, NoParams> {
  final SearchRepository searchRepository;

  GetAllCitiesToSearch({required this.searchRepository});
  @override
  Future<Either<Failure, List<CityModel>>> call(NoParams params) async {
    return searchRepository.getCities();
  }
}
