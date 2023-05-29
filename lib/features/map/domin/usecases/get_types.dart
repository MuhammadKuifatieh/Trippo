import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/type_respnse.dart';
import '../repositories/map_repository.dart';

class GetTypes implements UseCase<TypesResponse, NoParams> {
  final MapRepository mapRepository;

  GetTypes({required this.mapRepository});
  @override
  Future<Either<Failure, TypesResponse>> call(NoParams params) async {
    return mapRepository.getTypes();
  }
}
