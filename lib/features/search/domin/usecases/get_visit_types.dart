import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../place/data/models/visit_types_response.dart';
import '../repositories/search_repository.dart';

class GetVisitTypesToSearch implements UseCase<VisitTypesResponse, NoParams> {
  final SearchRepository searchRepository;

  GetVisitTypesToSearch({required this.searchRepository});
  @override
  Future<Either<Failure, VisitTypesResponse>> call(NoParams params) async {
    return searchRepository.getVisitTypes();
  }
}
