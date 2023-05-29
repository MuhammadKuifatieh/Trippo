import 'package:dartz/dartz.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/plans_repository.dart';

class GetPlanContentsUseCase
    implements UseCase<List<PlanContentModel>, GetPlanContentsParams> {
  final PlansRepository plansRepository;

  GetPlanContentsUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, List<PlanContentModel>>> call(
      GetPlanContentsParams params) async {
    return await plansRepository.getPlanContents(params);
  }
}

class GetPlanContentsParams {
  final int planId;
  final int page;
  final int perPage;

  GetPlanContentsParams({
    required this.planId,
    this.page = 1,
    this.perPage = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page.toString(),
      'perPage': perPage.toString(),
    };
  }
}
