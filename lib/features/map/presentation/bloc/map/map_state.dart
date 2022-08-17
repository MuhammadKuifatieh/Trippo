part of 'map_bloc.dart';

enum InitLocationStatus { init, getting, done }
enum PlaceToMapStatus { init, loading, succ, falied }
enum TypesToMapStatus { init, loading, succ, falied }

class MapState {
  final InitLocationStatus initLocationStatus;
  final List<PlaceModel> palces;
  final PlaceToMapStatus placeToMapStatus;
  final List<TypeModel> types;
  final TypesToMapStatus typesToMapStatus;
  final int typeIndex;
  final LatLngBounds? latLngBounds;
  final double? latitude;
  final double? longitude;
  final Set<Marker> markers;
  const MapState({
    this.latitude,
    this.longitude,
    this.latLngBounds,
    this.initLocationStatus = InitLocationStatus.init,
    this.typeIndex = 0,
    this.palces = const [],
    this.placeToMapStatus = PlaceToMapStatus.init,
    this.types = const [],
    this.typesToMapStatus = TypesToMapStatus.init,
    this.markers = const {},
  });
  MapState copyWith({
    InitLocationStatus? initLocationStatus,
    List<PlaceModel>? palces,
    PlaceToMapStatus? placeToMapStatus,
    List<TypeModel>? types,
    Set<Marker>? markers,
    TypesToMapStatus? typesToMapStatus,
    double? latitude,
    double? longitude,
    int? typeIndex,
    LatLngBounds? latLngBounds,
  }) {
    return MapState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      initLocationStatus: initLocationStatus ?? this.initLocationStatus,
      palces: palces ?? this.palces,
      placeToMapStatus: placeToMapStatus ?? this.placeToMapStatus,
      types: types ?? this.types,
      typesToMapStatus: typesToMapStatus ?? this.typesToMapStatus,
      latLngBounds: latLngBounds ?? this.latLngBounds,
      typeIndex: typeIndex ?? this.typeIndex,
      markers: markers ?? this.markers,
    );
  }
}
