part of 'add_experince_bloc.dart';

enum GetPlacesToAddExperince { succ, falied, loading, init }
enum AddExperinceStatus { succ, falied, loading, init }

class AddExperinceState {
  final GetPlacesToAddExperince getPlacesToAddExperince;
  final List<PlaceModel> places;
  final List<PlaceModel> selectedPlaces;
  final AddExperinceStatus addExperinceStatus;

  const AddExperinceState({
    this.places = const [],
    this.selectedPlaces = const [],
    this.getPlacesToAddExperince = GetPlacesToAddExperince.init,
    this.addExperinceStatus = AddExperinceStatus.init,
  });
  AddExperinceState copyWith({
    List<PlaceModel>? places,
    List<PlaceModel>? selectedPlaces,
    AddExperinceStatus? addExperinceStatus,
    GetPlacesToAddExperince? getPlacesToAddExperince,
  }) {
    return AddExperinceState(
      places: places ?? this.places,
      selectedPlaces: selectedPlaces ?? this.selectedPlaces,
      getPlacesToAddExperince:
          getPlacesToAddExperince ?? this.getPlacesToAddExperince,
      addExperinceStatus: addExperinceStatus ?? this.addExperinceStatus,
    );
  }
}
