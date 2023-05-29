import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_content_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_all_plans_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_plan_contents_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_user_plans_use_case.dart';

import '../use_cases/add_plan_use_case.dart';

abstract class PlansRepository {
  Future<Either<Failure, List<PlanModel>>> getAllPlans(
      GetAllPlansParams params);
  Future<Either<Failure, List<PlanModel>>> getUserPlans(
      GetUserPlansParams params);
  Future<Either<Failure, List<PlanContentModel>>> getPlanContents(
      GetPlanContentsParams params);
  Future<Either<Failure, PlanModel>> addPlan(AddPlansParams params);
  Future<Either<Failure, PlanContentModel>> addPlanContent(
      AddPlanContentParams params);
  Future<Either<Failure, bool>> deletePlan(int id);
  Future<Either<Failure, bool>> deletePlanContent(int id);
}
