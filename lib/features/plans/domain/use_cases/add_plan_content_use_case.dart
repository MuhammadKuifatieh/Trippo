import 'package:dartz/dartz.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';
import 'package:trippo/features/plans/domain/repository/plans_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';

class AddPlanContentUseCase
    implements UseCase<PlanContentModel, AddPlanContentParams> {
  final PlansRepository plansRepository;

  AddPlanContentUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, PlanContentModel>> call(
      AddPlanContentParams params) async {
    return await plansRepository.addPlanContent(params);
  }
}

class AddPlanContentParams {
  final int planId;
  final int placeId;
  final String comment;
  final String fullDate;

  AddPlanContentParams({
    required this.planId,
    required this.placeId,
    required this.comment,
    required this.fullDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'place_id': placeId,
      'comment': comment,
      'full_date': fullDate,
    };
  }
}
