part of 'map_bloc.dart';

abstract class MapEvent {
  const MapEvent();
}

class ChangeFitterValueEvent extends MapEvent {
  final int? index;
  final LatLngBounds? latLngBounds;

  ChangeFitterValueEvent({
    this.index,
    this.latLngBounds,
  });
}

class GetInitLocationEvent extends MapEvent {}

class GetPlacesToMapEvent extends MapEvent {}

class GetTypeToMapEvent extends MapEvent {}
