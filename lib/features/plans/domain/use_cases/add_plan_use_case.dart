import 'package:dartz/dartz.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/plans_repository.dart';

class AddPlanUseCase implements UseCase<PlanModel, AddPlansParams> {
  final PlansRepository plansRepository;

  AddPlanUseCase({required this.plansRepository});
  @override
  Future<Either<Failure, PlanModel>> call(AddPlansParams params) async {
    return await plansRepository.addPlan(params);
  }
}

class AddPlansParams {
  final String name;
  final String description;
  final String? image;
  final int cityId;

  AddPlansParams({
    required this.name,
    required this.description,
    this.image,
    required this.cityId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'city_id':cityId,
    };
  }
}
