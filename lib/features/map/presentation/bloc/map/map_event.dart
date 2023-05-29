part of 'map_bloc.dart';

abstract class MapEvent {
  const MapEvent();
}

class ChangeFitterValueEvent extends MapEvent {
  final int? index;
  final LatLngBounds? latLngBounds;
  final BuildContext context;

  ChangeFitterValueEvent({
    this.index,
    this.latLngBounds,
    required this.context,
  });
}

class GetInitLocationEvent extends MapEvent {}

class GetPlacesToMapEvent extends MapEvent {
  final BuildContext context;

  GetPlacesToMapEvent(this.context);
}

class GetTypeToMapEvent extends MapEvent {}

class UpdatePlaceFavoriteInMapEvent extends MapEvent {
  final int index;
  final bool isFavorite;

  UpdatePlaceFavoriteInMapEvent({
    required this.index,
    required this.isFavorite,
  });
}
