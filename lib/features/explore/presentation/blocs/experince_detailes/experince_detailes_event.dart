part of 'experince_detailes_bloc.dart';

abstract class ExperinceDetailesEvent {
  const ExperinceDetailesEvent();
}

class GetExperinceDetailesEvent extends ExperinceDetailesEvent {
  final String id;

  GetExperinceDetailesEvent({required this.id});
}

class GetPlacesToExperinceEvent extends ExperinceDetailesEvent {
  final String id;

  GetPlacesToExperinceEvent({required this.id});
}
