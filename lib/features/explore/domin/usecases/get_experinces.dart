import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/experienes_response.dart';
import '../repositories/experince_repository.dart';

class GetExperience
    implements UseCase<ExperiencesResponse, GetExperiencesParams> {
  final ExperinceRepository experinceRepository;

  GetExperience({required this.experinceRepository});
  @override
  Future<Either<Failure, ExperiencesResponse>> call(
      GetExperiencesParams params) async {
    return experinceRepository.getExperiences(params.getParams());
  }
}

class GetExperiencesParams {
  final int page;
  final int perPage;

  GetExperiencesParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() {
    return {
      "page": page.toString(),
      "perPage": perPage.toString(),
    };
  }
}
