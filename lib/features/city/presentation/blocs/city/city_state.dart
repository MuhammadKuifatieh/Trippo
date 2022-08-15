part of 'city_bloc.dart';

enum GetCityStatus { initial, loading, success, failure }
enum GetPlacesOfCityStatus { initial, loading, success, failure }
enum QuestionAddingStatus { initial, loading, success, failure }

class CityState {
  const CityState({
    this.placesOfCity = const [],
    this.placesOfCityStatus = GetPlacesOfCityStatus.initial,
    this.city = const CityModel(),
    this.cityStatus = GetCityStatus.initial,
    this.questionAddingStatus = QuestionAddingStatus.initial,
  });
  final CityModel city;
  final List<PlaceOfCityModel> placesOfCity;
  final GetCityStatus cityStatus;
  final GetPlacesOfCityStatus placesOfCityStatus;
  final QuestionAddingStatus questionAddingStatus;

  CityState copyWith({
    CityModel? city,
    GetCityStatus? cityStatus,
    List<PlaceOfCityModel>? placesOfCity,
    GetPlacesOfCityStatus? placesOfCityStatus,
    QuestionAddingStatus? questionAddingStatus,
  }) {
    return CityState(
      city: city ?? this.city,
      cityStatus: cityStatus ?? this.cityStatus,
      placesOfCity: placesOfCity ?? this.placesOfCity,
      placesOfCityStatus: placesOfCityStatus ?? this.placesOfCityStatus,
      questionAddingStatus: questionAddingStatus ?? this.questionAddingStatus,
    );
  }
}
