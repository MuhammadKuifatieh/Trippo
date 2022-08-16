import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/domain/repository/plans_repository.dart';

import '../../../../core/use_case/use_case.dart';

class GetAllPlansUseCase
    implements UseCase<List<PlanModel>, GetAllPlansParams> {
  final PlansRepository plansRepository;

  GetAllPlansUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, List<PlanModel>>> call(
      GetAllPlansParams params) async {
    return await plansRepository.getAllPlans(params);
  }
}

class GetAllPlansParams {
  final int cityId;
  final int page;
  final int perPage;

  GetAllPlansParams({
    required this.cityId,
    this.page = 1,
    this.perPage = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page.toString(),
      'perPage': perPage.toString(),
      'cityId':cityId.toString(),
    };
  }
}
