import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:trippo/features/city/data/models/question/question_model.dart';
import 'package:trippo/features/city/data/repositories/city_repository_impl.dart';
import 'package:trippo/features/city/domain/usecases/add_answer_use_case.dart';
import 'package:trippo/features/city/domain/usecases/add_question_use_case.dart';
import 'package:trippo/features/city/domain/usecases/delete_question_use_case.dart';
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
    on<QuestionDeleted>(_mapQuestionDeleted);
    on<AnswerAdded>(_mapAnswerAdded);
  }

  final _getQuestionsUseCase =
      GetQuestionsUseCase(cityRepository: CityRepositoryImpl());
  final _deleteQuestionUseCase =
      DeleteQuestionUseCase(cityRepository: CityRepositoryImpl());
  final _addAnswerUseCase =
      AddAnswerUseCase(cityRepository: CityRepositoryImpl());

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

  FutureOr<void> _mapQuestionDeleted(
      QuestionDeleted event, Emitter<QuestionsState> emit) async {
    emit(state.copyWith(
      addingDeletingStatus: AddingDeletingStatus.loading,
    ));
    final index =
        state.questions.indexWhere((element) => element.id == event.id);
    final result = await _deleteQuestionUseCase(event.id);
    await result.fold(
      (l) async {
        emit(state.copyWith(
            addingDeletingStatus: AddingDeletingStatus.failure,
            notifyMessage: 'Deleting Question Failed'));
      },
      (r) async {
        emit(state.copyWith(
            addingDeletingStatus: AddingDeletingStatus.success,
            questions: List.of(state.questions)..removeAt(index),
            notifyMessage: 'Deleting Question Done Successfully'));
      },
    );
    emit(state.copyWith(
      addingDeletingStatus: AddingDeletingStatus.initial,
    ));
  }

  FutureOr<void> _mapAnswerAdded(
      AnswerAdded event, Emitter<QuestionsState> emit) async {
    emit(state.copyWith(
      addingDeletingStatus: AddingDeletingStatus.loading,
    ));
    final questionIndex = state.questions
        .indexWhere((element) => element.id == event.params.questionId);
    final result = await _addAnswerUseCase(event.params);
    await result.fold(
      (l) async {
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.failure,
          notifyMessage: 'Adding Answer Failed',
        ));
      },
      (answer) async {
        state.questions[questionIndex].answers.insert(0, answer);
        emit(state.copyWith(
          addingDeletingStatus: AddingDeletingStatus.success,
          questions: List.of(state.questions),
          notifyMessage: 'Adding Answer Done Successfully',
        ));
      },
    );
    emit(state.copyWith(
      addingDeletingStatus: AddingDeletingStatus.initial,
    ));
  }
}
