part of 'experinces_bloc.dart';

enum ExperincesStatus { init, falied, succ, loading }

class ExperincesState {
  final ExperincesStatus experincesStatus;
  final List<ExperienceModel> experiences;
  final bool isEndPage;
  const ExperincesState({
    this.isEndPage = false,
    this.experiences = const [],
    this.experincesStatus = ExperincesStatus.init,
  });
  ExperincesState copyWith({
    bool? isEndPage,
    ExperincesStatus? experincesStatus,
    List<ExperienceModel>? experiences,
  }) {
    return ExperincesState(
      isEndPage: isEndPage ?? this.isEndPage,
      experiences: experiences ?? this.experiences,
      experincesStatus: experincesStatus ?? this.experincesStatus,
    );
  }
}
