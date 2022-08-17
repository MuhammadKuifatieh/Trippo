import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/plans/data/data_sources/plans_data_source.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/domain/repository/plans_repository.dart';
import 'package:trippo/features/plans/domain/use_cases/get_user_plans_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_plan_contents_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_all_plans_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_content_use_case.dart';

class PlansRepositoryImpl
    with HandlingExceptionManager
    implements PlansRepository {
  final _plansDataSource = PlansDataSource();

  @override
  Future<Either<Failure, PlanModel>> addPlan(AddPlansParams params) async {
    return await wrapHandling<PlanModel>(tryCall: () async {
      final model = await _plansDataSource.addPlan(body: params.toMap());
      return Right(model);
    });
  }

  @override
  Future<Either<Failure, PlanContentModel>> addPlanContent(
      AddPlanContentParams params) async {
    return await wrapHandling<PlanContentModel>(tryCall: () async {
      final model = await _plansDataSource.addPlanContent(
          body: params.toMap(), planId: params.planId);
      return Right(model);
    });
  }

  @override
  Future<Either<Failure, bool>> deletePlan(int id) async {
    return await wrapHandling<bool>(tryCall: () async {
      final model = await _plansDataSource.deletePlan(id);
      return Right(model);
    });
  }

  @override
  Future<Either<Failure, bool>> deletePlanContent(int id) async {
    return await wrapHandling<bool>(tryCall: () async {
      final model = await _plansDataSource.deletePlanContent(id);
      return Right(model);
    });
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getAllPlans(
      GetAllPlansParams params) async {
    return await wrapHandling<List<PlanModel>>(tryCall: () async {
      final models =
          await _plansDataSource.getAllPlans(queryParams: params.toMap());
      return Right(models);
    });
  }

  @override
  Future<Either<Failure, List<PlanContentModel>>> getPlanContents(
      GetPlanContentsParams params) async {
    return await wrapHandling<List<PlanContentModel>>(tryCall: () async {
      final models = await _plansDataSource.getPlanContents(
          planId: params.planId, queryParams: params.toMap());
      return Right(models);
    });
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getUserPlans(
      GetUserPlansParams params) async {
    return await wrapHandling<List<PlanModel>>(tryCall: () async {
      final models =
          await _plansDataSource.getUserPlans(queryParams: params.toMap());
      return Right(models);
    });
  }
}
