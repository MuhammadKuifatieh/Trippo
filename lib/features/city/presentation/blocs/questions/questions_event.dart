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
