part of 'city_bloc.dart';

enum GetCityStatus { initial, loading, success, failure }
enum FetchingStatus { initial, loading, success, failure }
enum GetPlacesOfCityStatus { initial, loading, success, failure }
enum QuestionAddingStatus { initial, loading, success, failure }

class CityState {
  const CityState({
    this.placesOfCity = const [],
    this.placesOfCityStatus = GetPlacesOfCityStatus.initial,
    this.city = const CityModel(),
    this.cityStatus = GetCityStatus.initial,
    this.questionAddingStatus = QuestionAddingStatus.initial,
    this.hasReachedMax = false,
    this.fetchingStatus = FetchingStatus.initial,
    this.plans = const [],
  });
  final CityModel city;
  final List<PlaceModel> placesOfCity;
  final GetCityStatus cityStatus;
  final GetPlacesOfCityStatus placesOfCityStatus;
  final QuestionAddingStatus questionAddingStatus;
  final List<PlanModel> plans;
  final FetchingStatus fetchingStatus;
  final bool hasReachedMax;

  CityState copyWith({
    CityModel? city,
    GetCityStatus? cityStatus,
    List<PlaceModel>? placesOfCity,
    GetPlacesOfCityStatus? placesOfCityStatus,
    QuestionAddingStatus? questionAddingStatus,
    List<PlanModel>? plans,
    bool? hasReachedMax,
    FetchingStatus? fetchingStatus,
  }) {
    return CityState(
      city: city ?? this.city,
      cityStatus: cityStatus ?? this.cityStatus,
      placesOfCity: placesOfCity ?? this.placesOfCity,
      placesOfCityStatus: placesOfCityStatus ?? this.placesOfCityStatus,
      questionAddingStatus: questionAddingStatus ?? this.questionAddingStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      plans: plans ?? this.plans,
      fetchingStatus: fetchingStatus ?? this.fetchingStatus,
    );
  }
}
