part of 'city_bloc.dart';

enum GetCityStatus {
  initial,
  loading,
  success,
  failure,
}
enum GetPlacesOfCityStatus {
  initial,
  loading,
  success,
  failure,
}

class CityState {
  const CityState(
      {this.placesOfCity = const [],
      
      this.placesOfCityStatus = GetPlacesOfCityStatus.initial,
    
      this.city = const CityModel(),
      this.cityStatus = GetCityStatus.initial});
  final CityModel city;
  final List<PlaceOfCityModel> placesOfCity;
  
  final GetCityStatus cityStatus;
  final GetPlacesOfCityStatus placesOfCityStatus;
 

  CityState copyWith({
    CityModel? city,
    GetCityStatus? cityStatus,
     List<PlaceOfCityModel>? placesOfCity,
  
  GetPlacesOfCityStatus? placesOfCityStatus,
 
  }) {
    return CityState(
      city: city ?? this.city,
      cityStatus: cityStatus ?? this.cityStatus,
      placesOfCity: placesOfCity ?? this.placesOfCity,
      placesOfCityStatus: placesOfCityStatus ?? this.placesOfCityStatus,
    

    );
  }
}
