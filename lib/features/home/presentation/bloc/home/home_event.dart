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

class UpdateRecentlyViewedPlaceFavoriteEvent extends HomeEvent {
  final int index;
  final bool favoriteValue;
  const UpdateRecentlyViewedPlaceFavoriteEvent({
    required this.index,
    required this.favoriteValue,
  });
}

class UpdateMightLikePlaceFavoriteEvent extends HomeEvent {
  final int index;
  final bool favoriteValue;
  const UpdateMightLikePlaceFavoriteEvent({
    required this.index,
    required this.favoriteValue,
  });
}

class UpdateSmallBatchPlaceFavoriteEvent extends HomeEvent {
  final int index;
  final bool favoriteValue;
  const UpdateSmallBatchPlaceFavoriteEvent({
    required this.index,
    required this.favoriteValue,
  });
}

class UpdateTopAttractionPlaceFavoriteEvent extends HomeEvent {
  final int index;
  final bool favoriteValue;
  const UpdateTopAttractionPlaceFavoriteEvent({
    required this.index,
    required this.favoriteValue,
  });
}
