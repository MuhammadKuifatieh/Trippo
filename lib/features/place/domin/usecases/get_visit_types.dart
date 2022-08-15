import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/visit_types_response.dart';
import '../repositories/place_repository.dart';

class GetVisitTypes implements UseCase<VisitTypesResponse, NoParams> {
  final PlaceRepository placeRepository;

  GetVisitTypes({required this.placeRepository});
  @override
  Future<Either<Failure, VisitTypesResponse>> call(NoParams params) async {
    return placeRepository.getVisitTypes();
  }
}
