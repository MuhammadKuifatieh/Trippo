part of 'plan_content_bloc.dart';

abstract class PlanContentEvent extends Equatable {
  const PlanContentEvent();

  @override
  List<Object> get props => [];
}

class PlanContentFetched extends PlanContentEvent {
  final int planId;

  const PlanContentFetched(this.planId);
}
