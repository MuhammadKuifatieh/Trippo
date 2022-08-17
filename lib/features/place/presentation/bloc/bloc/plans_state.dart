part of 'plans_bloc.dart';

enum PlansFetchingStatus { initial, loading, success, failure }
enum AddingDeletingStatus { initial, loading, success, failure }

class PlansState {
  const PlansState({
    this.plans = const [],
    this.plansFetchingStatus = PlansFetchingStatus.initial,
    this.addingDeletingStatus = AddingDeletingStatus.initial,
    this.notifyMessage = '',
  });

  final List<PlanModel> plans;
  final PlansFetchingStatus plansFetchingStatus;
  final AddingDeletingStatus addingDeletingStatus;
  final String notifyMessage;

  PlansState copyWith({
    List<PlanModel>? plans,
    PlansFetchingStatus? plansFetchingStatus,
    AddingDeletingStatus? addingDeletingStatus,
    String? notifyMessage,
  }) {
    return PlansState(
      plans: plans ?? this.plans,
      plansFetchingStatus: plansFetchingStatus ?? this.plansFetchingStatus,
      addingDeletingStatus: addingDeletingStatus ?? this.addingDeletingStatus,
      notifyMessage: notifyMessage ?? this.notifyMessage,
    );
  }
}
