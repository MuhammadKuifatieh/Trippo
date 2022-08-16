part of 'plans_bloc.dart';

abstract class PlansEvent extends Equatable {
  const PlansEvent();

  @override
  List<Object> get props => [];
}

class UserPlansFetched extends PlansEvent {
  final int cityId;
  const UserPlansFetched({required this.cityId});
}


class PlanAdded extends PlansEvent {
  final AddPlansParams addPlansParams;

  const PlanAdded(this.addPlansParams);
}
