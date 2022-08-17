import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/explore/data/models/experince_detailes_response.dart';
import 'package:trippo/features/explore/domin/repositories/experince_repository.dart';

class GetExperinceDetailes
    implements UseCase<ExperienceDetailesResponse, GetExperinceDetailsParams> {
  final ExperinceRepository experinceRepository;

  GetExperinceDetailes({required this.experinceRepository});

  @override
  Future<Either<Failure, ExperienceDetailesResponse>> call(
      GetExperinceDetailsParams params) async {
    return experinceRepository.getExperinceDetails(params.id);
  }
}

class GetExperinceDetailsParams {
  final String id;

  GetExperinceDetailsParams({required this.id});
}
