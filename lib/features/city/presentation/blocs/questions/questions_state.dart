part of 'questions_bloc.dart';

enum QuestionsStatus { initial, failure, success, loading }
enum AddingDeletingStatus { initial, failure, success, loading }

class QuestionsState {
  const QuestionsState({
    this.questions = const [],
    this.status = QuestionsStatus.initial,
    this.hasReachedMax = false,
    this.addingDeletingStatus = AddingDeletingStatus.initial,
    this.notifyMessage = '',
  });
  final List<QuestionModel> questions;
  final QuestionsStatus status;
  final bool hasReachedMax;
  final AddingDeletingStatus addingDeletingStatus;
  final String notifyMessage;

  QuestionsState copyWith({
    List<QuestionModel>? questions,
    AddingDeletingStatus? addingDeletingStatus,
    QuestionsStatus? status,
    bool? hasReachedMax,
    String? notifyMessage,
  }) {
    return QuestionsState(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      questions: questions ?? this.questions,
      status: status ?? this.status,
      addingDeletingStatus: addingDeletingStatus ?? this.addingDeletingStatus,
      notifyMessage: notifyMessage ?? this.notifyMessage,
    );
  }
}
