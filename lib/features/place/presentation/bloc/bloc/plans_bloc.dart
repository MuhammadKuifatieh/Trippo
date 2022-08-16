import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trippo/features/home/data/repositories/home_repository_implement.dart';
import 'package:trippo/features/home/domin/usecases/get_all_cities_use_case.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/data/repository/plans_repository_impl.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_content_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/get_user_plans_use_case.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  PlansBloc() : super(const PlansState()) {
    on<UserPlansFetched>(_mapUserPlansFetched);
    on<PlanAdded>(_mapPlanAdded);
    on<PlanContentAdded>(_mapPlanContentAdded);
  }
  final _getUserPlans =
      GetUserPlansUseCase(plansRepository: PlansRepositoryImpl());
  final _addPlanUseCase =
      AddPlanUseCase(plansRepository: PlansRepositoryImpl());
  final _addPlanContentUseCase =
      AddPlanContentUseCase(plansRepository: PlansRepositoryImpl());

  FutureOr<void> _mapUserPlansFetched(
      UserPlansFetched event, Emitter<PlansState> emit) async {
    final result = await _getUserPlans(
      GetUserPlansParams(
        page: 1,
        perPage: 100,
        cityId: event.cityId,
      ),
    );

    await result.fold(
      (l) async {
        emit(state.copyWith(plansFetchingStatus: PlansFetchingStatus.failure));
      },
      (plans) async {
        emit(state.copyWith(
          plansFetchingStatus: PlansFetchingStatus.success,
          plans: plans,
        ));
      },
    );
  }

  FutureOr<void> _mapPlanAdded(
      PlanAdded event, Emitter<PlansState> emit) async {
    emit(state.copyWith(addingDeletingStatus: AddingDeletingStatus.loading));
    final result = await _addPlanUseCase(event.addPlansParams);

    await result.fold(
      (l) async {
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.failure,
          notifyMessage: 'Adding Plan Failed',
        ));
      },
      (plan) async {
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.success,
          notifyMessage: 'Adding Plan Done Successfully',
          plans: List.of(state.plans)..insert(0, plan),
        ));
      },
    );
    emit(state.copyWith(addingDeletingStatus: AddingDeletingStatus.initial));
  }

  FutureOr<void> _mapPlanContentAdded(
      PlanContentAdded event, Emitter<PlansState> emit) async {
    emit(state.copyWith(addingDeletingStatus: AddingDeletingStatus.loading));
    final result = await _addPlanContentUseCase(event.addPlanContentParams);

    await result.fold(
      (l) async {
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.failure,
          notifyMessage: 'Adding Place To Plan Failed',
        ));
      },
      (planContent) async {
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.success,
          notifyMessage: 'Adding Plan To Plan Done Successfully',
        ));
      },
    );
    emit(state.copyWith(addingDeletingStatus: AddingDeletingStatus.initial));
  }
}
