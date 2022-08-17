import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/map/data/models/type_respnse.dart';
import 'package:trippo/features/search/domin/repositories/search_repository.dart';

class GetTypesToSearch implements UseCase<TypesResponse, NoParams> {
  final SearchRepository searchRepository;

  GetTypesToSearch({required this.searchRepository});
  @override
  Future<Either<Failure, TypesResponse>> call(NoParams params) async {
    return searchRepository.getTypes();
  }
}
