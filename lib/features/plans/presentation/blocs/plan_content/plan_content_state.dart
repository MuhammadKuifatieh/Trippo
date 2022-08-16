part of 'plan_content_bloc.dart';

enum PlanContentStatus { initial, success, failure }

class PlanContentState {
  final PlanContentStatus status;
  final List<PlanContentModel> planContents;
  const PlanContentState({
    this.status = PlanContentStatus.initial,
    this.planContents = const [],
  });

  PlanContentState copyWith({
    PlanContentStatus? status,
    List<PlanContentModel>? planContents,
  }) {
    return PlanContentState(
      planContents: planContents ?? this.planContents,
      status: status ?? this.status,
    );
  }
}
