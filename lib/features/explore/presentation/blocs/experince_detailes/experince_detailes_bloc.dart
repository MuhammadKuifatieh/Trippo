import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../home/data/models/places_response.dart';
import '../../../data/models/experienes_response.dart';
import '../../../data/repositories/experince_repository_implement.dart';
import '../../../domin/usecases/get_experince_detailes.dart';
import '../../../domin/usecases/get_places_to_experince.dart';

part 'experince_detailes_event.dart';
part 'experince_detailes_state.dart';

class ExperinceDetailesBloc
    extends Bloc<ExperinceDetailesEvent, ExperinceDetailesState> {
  final _getPlacesToExperince =
      GetPlacesToExperince(experinceRepository: ExperinceRepositoryImplement());

  final _getExperince =
      GetExperinceDetailes(experinceRepository: ExperinceRepositoryImplement());
  ExperinceDetailesBloc() : super(const ExperinceDetailesState()) {
    on<GetPlacesToExperinceEvent>(_mapGetPlacesToExperinceState);
    on<GetExperinceDetailesEvent>(
      _mapGetExperinceState,
      transformer: sequential(),
    );
  }

  FutureOr<void> _mapGetExperinceState(GetExperinceDetailesEvent event,
      Emitter<ExperinceDetailesState> emit) async {
    final result = await _getExperince(GetExperinceDetailsParams(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          experinceDetailesStatus: ExperinceDetailesStatus.falied,
        ),
      ),
      (r) => emit(
        state.copyWith(
          experinceDetailesStatus: ExperinceDetailesStatus.succ,
          experience: r.data!.experience,
        ),
      ),
    );
  }

  FutureOr<void> _mapGetPlacesToExperinceState(GetPlacesToExperinceEvent event,
      Emitter<ExperinceDetailesState> emit) async {
    emit(state.copyWith(
        placesToExperinceStatus: PlacesToExperinceStatus.loading));
    final result =
        await _getPlacesToExperince(GetPlacesToExperinceParams(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        placesToExperinceStatus: PlacesToExperinceStatus.falied,
      )),
      (r) => emit(state.copyWith(
        places: r.data!.places,
        placesToExperinceStatus: PlacesToExperinceStatus.succ,
      )),
    );
  }
}
