import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:trippo/features/city/data/models/question/question_model.dart';
import 'package:trippo/features/city/data/repositories/city_repository_impl.dart';
import 'package:trippo/features/city/domain/usecases/get_questions_use_case.dart';

part 'questions_event.dart';
part 'questions_state.dart';

const throttleDuration = Duration(milliseconds: 200);
const pageSize = 10;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(const QuestionsState()) {
    on<QuestionsFetched>(
      _mapQuestionsFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final _getQuestionsUseCase =
      GetQuestionsUseCase(cityRepository: CityRepositoryImpl());

  FutureOr<void> _mapQuestionsFetched(
      QuestionsFetched event, Emitter<QuestionsState> emit) async {
    if (state.hasReachedMax) return;
    final result = await _getQuestionsUseCase(GetQuestionsParams(
      cityId: event.cityId,
      page: (state.questions.length ~/ pageSize) + 1,
      perPage: pageSize,
    ));

    await result.fold(
      (l) async {
        emit(state.copyWith(status: QuestionsStatus.failure));
      },
      (newQuestions) async {
        emit(state.copyWith(
          status: QuestionsStatus.success,
          questions: List.of(state.questions)..addAll(newQuestions),
          hasReachedMax: newQuestions.length < pageSize,
        ));
      },
    );
  }
}
