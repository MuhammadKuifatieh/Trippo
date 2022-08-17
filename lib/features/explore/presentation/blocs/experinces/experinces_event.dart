part of 'experinces_bloc.dart';

abstract class ExperincesEvent {
  const ExperincesEvent();
}

class GetExperincesEvent extends ExperincesEvent {
  final bool isReload;
  const GetExperincesEvent({
    this.isReload = false,
  });
}
