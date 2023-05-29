import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';
import 'package:trippo/features/plans/data/repository/plans_repository_impl.dart';
import 'package:trippo/features/plans/domain/use_cases/get_plan_contents_use_case.dart';

part 'plan_content_event.dart';
part 'plan_content_state.dart';

class PlanContentBloc extends Bloc<PlanContentEvent, PlanContentState> {
  PlanContentBloc() : super(const PlanContentState()) {
    on<PlanContentFetched>(_mapPlanContentFetched);
  }

  final _getPlanContentsUseCase =
      GetPlanContentsUseCase(plansRepository: PlansRepositoryImpl());

  FutureOr<void> _mapPlanContentFetched(
      PlanContentFetched event, Emitter<PlanContentState> emit) async {
    final result = await _getPlanContentsUseCase(
        GetPlanContentsParams(planId: event.planId));

    await result.fold(
      (l) async {
        emit(state.copyWith(status: PlanContentStatus.failure));
      },
      (planContents) async {
        emit(state.copyWith(
          status: PlanContentStatus.success,
          planContents: planContents,
        ));
      },
    );
  }
}
