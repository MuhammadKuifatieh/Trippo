part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class QuestionsFetched extends QuestionsEvent {
  final int cityId;
  const QuestionsFetched(this.cityId);
}

class QuestionAdded extends QuestionsEvent {
  final AddQuestionParams params;

  const QuestionAdded(this.params);
}

class AnswerAdded extends QuestionsEvent {
  final AddAnswerParams params;

  const AnswerAdded(this.params);
}

class QuestionDeleted extends QuestionsEvent {
  final int id;

  const QuestionDeleted(this.id);
}

class AnswerDeleted extends QuestionsEvent {
  final int questionId;
  final int answerId;

  const AnswerDeleted({required this.questionId, required this.answerId});
}
