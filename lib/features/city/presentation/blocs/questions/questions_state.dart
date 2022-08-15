part of 'questions_bloc.dart';

enum QuestionsStatus { initial, failure, success, loading }

class QuestionsState {
  const QuestionsState({
    this.questions = const [],
    this.status = QuestionsStatus.initial,
    this.hasReachedMax = false,
  });
  final List<QuestionModel> questions;
  final QuestionsStatus status;
  final bool hasReachedMax;

  QuestionsState copyWith({
    List<QuestionModel>? questions,
    QuestionsStatus? status,
    bool? hasReachedMax,
  }) {
    return QuestionsState(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      questions: questions ?? this.questions,
      status: status ?? this.status,
    );
  }
}
