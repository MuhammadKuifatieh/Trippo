part of 'city_bloc.dart';

abstract class CityEvent {
  const CityEvent();
}

class GetCityEvent extends CityEvent {
  const GetCityEvent({required this.cityId});
  final int cityId;
}

class GetPlacesOfCityEvent extends CityEvent {
  const GetPlacesOfCityEvent({required this.cityId});
  final int cityId;
}

class QuestionAdded extends CityEvent {
  final AddQuestionParams params;

  QuestionAdded(this.params);
}

class QuestionsFetched extends CityEvent {
  // final GetQuestionsParams params;

  // QuestionsFetched(this.params);
}

class QuestionDeleted extends CityEvent {
  final int id;

  QuestionDeleted(this.id);
}

class PublicPlansFetched extends CityEvent {
  final int cityId;

  PublicPlansFetched(this.cityId);
}
