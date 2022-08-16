import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/domain/repository/plans_repository.dart';

import '../../../../core/use_case/use_case.dart';

class GetAllPlansUseCase implements UseCase<List<PlanModel>, GetPlansParams> {
  final PlansRepository plansRepository;

  GetAllPlansUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, List<PlanModel>>> call(GetPlansParams params) async {
    return await plansRepository.getAllPlans(params);
  }
}

class GetPlansParams {
  final int cityId;
  final int page;
  final int perPage;

  GetPlansParams({
    required this.cityId,
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
