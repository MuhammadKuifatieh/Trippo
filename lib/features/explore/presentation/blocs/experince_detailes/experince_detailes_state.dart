part of 'experince_detailes_bloc.dart';

enum PlacesToExperinceStatus { init, loading, falied, succ }
enum ExperinceDetailesStatus { init, loading, falied, succ }

class ExperinceDetailesState {
  final ExperienceModel? experience;
  final List<PlaceModel> places;
  final PlacesToExperinceStatus placesToExperinceStatus;
  final ExperinceDetailesStatus experinceDetailesStatus;
  const ExperinceDetailesState({
    this.placesToExperinceStatus = PlacesToExperinceStatus.init,
    this.places = const [],
    this.experience,
    this.experinceDetailesStatus = ExperinceDetailesStatus.init,
  });
  ExperinceDetailesState copyWith({
    ExperienceModel? experience,
    ExperinceDetailesStatus? experinceDetailesStatus,
    List<PlaceModel>? places,
    PlacesToExperinceStatus? placesToExperinceStatus,
  }) {
    return ExperinceDetailesState(
      places: places ?? this.places,
      placesToExperinceStatus:
          placesToExperinceStatus ?? this.placesToExperinceStatus,
      experience: experience ?? this.experience,
      experinceDetailesStatus:
          experinceDetailesStatus ?? this.experinceDetailesStatus,
    );
  }
}
