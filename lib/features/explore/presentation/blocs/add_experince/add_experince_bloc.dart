import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../home/data/models/places_response.dart';
import '../../../../search/data/repositories/search_repository_implement.dart';
import '../../../../search/domin/usecases/get_places_to_search.dart';
import '../../../data/repositories/experince_repository_implement.dart';
import '../../../domin/usecases/add_experince.dart';

part 'add_experince_event.dart';
part 'add_experince_state.dart';

class AddExperinceBloc extends Bloc<AddExperinceEvent, AddExperinceState> {
  final _getPlaces =
      GetPlacesToSearch(searchRepository: SearchRepositoryImplement());
  final _addExperince =
      AddExperince(experinceRepository: ExperinceRepositoryImplement());
  AddExperinceBloc() : super(const AddExperinceState()) {
    on<AddToSelectedPlaces>((event, emit) {
      emit(state.copyWith(
          selectedPlaces: List.of(state.selectedPlaces)..add(event.place)));
    });
    on<RemveToSelectedPlaces>((event, emit) {
      emit(state.copyWith(
          selectedPlaces: List.of(state.selectedPlaces)
            ..removeWhere(((element) => event.place.id == element.id))));
    });
    on<GetPlacesToAddExperinceEvent>(_mapGetPlaces);
    on<GoAddExperinceEvent>(_mapAddExperinceState);
  }
  FutureOr<void> _mapGetPlaces(GetPlacesToAddExperinceEvent event,
      Emitter<AddExperinceState> emit) async {
    emit(state.copyWith(
        getPlacesToAddExperince: GetPlacesToAddExperince.loading));
    final result = await _getPlaces(GetPlacesToSearchParams(name: event.name));
    result.fold(
      (l) => emit(state.copyWith(
        getPlacesToAddExperince: GetPlacesToAddExperince.falied,
      )),
      (r) => emit(state.copyWith(
        getPlacesToAddExperince: GetPlacesToAddExperince.succ,
        places: r.data!.places,
      )),
    );
  }

  FutureOr<void> _mapAddExperinceState(
      GoAddExperinceEvent event, Emitter<AddExperinceState> emit) async {
    emit(state.copyWith(addExperinceStatus: AddExperinceStatus.loading));
    final result = await _addExperince(AddExperinceParams(
      name: event.name,
      about: event.about,
      address: event.address,
      price: event.price,
      placeId: state.selectedPlaces.map((e) => e.id.toString()).toList(),
      images: event.images,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          addExperinceStatus: AddExperinceStatus.falied,
        ),
      ),
      (r) => emit(state.copyWith(
        addExperinceStatus: AddExperinceStatus.succ,
      )),
    );
  }
}
