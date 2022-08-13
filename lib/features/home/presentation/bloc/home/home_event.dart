part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetHomeInfoEvent extends HomeEvent {
  const GetHomeInfoEvent();
}

class GetTrendingCitiesEvent extends HomeEvent {
  const GetTrendingCitiesEvent();
}

class GetRecentlyViewedPlacesEvent extends HomeEvent {
  const GetRecentlyViewedPlacesEvent();
}

class GetMightLikePlacesEvent extends HomeEvent {
  const GetMightLikePlacesEvent();
}

class GetSmallBatchPlacesEvent extends HomeEvent {
  const GetSmallBatchPlacesEvent();
}

class GetTopAttractionPlacesEvent extends HomeEvent {
  const GetTopAttractionPlacesEvent();
}
