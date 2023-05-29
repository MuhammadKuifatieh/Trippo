import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/experienes_response.dart';
import '../../../data/repositories/experince_repository_implement.dart';
import '../../../domin/usecases/get_experinces.dart';

part 'experinces_event.dart';
part 'experinces_state.dart';

class ExperincesBloc extends Bloc<ExperincesEvent, ExperincesState> {
  final _getExperinces =
      GetExperience(experinceRepository: ExperinceRepositoryImplement());
  final perPage = 10;
  ExperincesBloc() : super(const ExperincesState()) {
    on<GetExperincesEvent>(_mapGetGetExperinces);
  }
  FutureOr<void> _mapGetGetExperinces(
      GetExperincesEvent event, Emitter<ExperincesState> emit) async {
    if (state.experincesStatus == ExperincesStatus.init || event.isReload) {
      emit(state.copyWith(experincesStatus: ExperincesStatus.loading));
      final result = await _getExperinces(GetExperiencesParams(
        page: 1,
        perPage: perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          experincesStatus: ExperincesStatus.falied,
        )),
        (r) => emit(state.copyWith(
          experiences: r.data!.experiences,
          experincesStatus: ExperincesStatus.succ,
          isEndPage: r.data!.experiences!.length < perPage,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(experincesStatus: ExperincesStatus.loading));
      final result = await _getExperinces(GetExperiencesParams(
        page: state.experiences.length ~/ perPage,
        perPage: perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          experincesStatus: ExperincesStatus.falied,
        )),
        (r) => emit(state.copyWith(
          experiences: List.of(state.experiences)..addAll(r.data!.experiences!),
          experincesStatus: ExperincesStatus.succ,
          isEndPage: r.data!.experiences!.length < perPage,
        )),
      );
    }
  }
}
