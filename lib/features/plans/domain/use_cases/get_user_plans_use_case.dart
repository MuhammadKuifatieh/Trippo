import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/plan/plan_model.dart';
import '../repository/plans_repository.dart';

class GetUserPlansUseCase
    implements UseCase<List<PlanModel>, GetUserPlansParams> {
  final PlansRepository plansRepository;

  GetUserPlansUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, List<PlanModel>>> call(
      GetUserPlansParams params) async {
    return await plansRepository.getUserPlans(params);
  }
}

class GetUserPlansParams {
  final int page;
  final int perPage;
  final int cityId;

  GetUserPlansParams({
    this.page = 1,
    this.perPage = 10,
    required this.cityId,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page.toString(),
      'perPage': perPage.toString(),
      'city_id': cityId.toString(),
    };
  }
}
