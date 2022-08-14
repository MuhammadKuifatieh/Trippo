part of 'city_bloc.dart';

abstract class CityEvent {
  const CityEvent();

 
}

class GetCityEvent extends CityEvent
{
  const GetCityEvent({required this.cityId});
  final int cityId;

}
class  GetPlacesOfCityEvent extends CityEvent{
  const GetPlacesOfCityEvent({required this.cityId});
  final int cityId;

}