import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/data/models/places_response.dart';
import '../repositories/experince_repository.dart';

class GetPlacesToExperince
    implements UseCase<PlacesResponse, GetPlacesToExperinceParams> {
  final ExperinceRepository experinceRepository;

  GetPlacesToExperince({required this.experinceRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetPlacesToExperinceParams params) async {
    return experinceRepository.getPlacesToExperince(params.id);
  }
}

class GetPlacesToExperinceParams {
  final String id;

  GetPlacesToExperinceParams({required this.id});
}
