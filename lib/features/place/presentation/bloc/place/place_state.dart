part of 'place_bloc.dart';

enum PlaceStatus { init, succ, loading, failed }
enum NearbyPlacesStatus { init, succ, loading, failed }
enum UploadImagePlaceStatus { init, succ, loading, failed }

class PlaceState {
  final PlaceModel? place;
  final List<PlaceModel> nearbyPlaces;
  final PlaceStatus placeStatus;
  final NearbyPlacesStatus nearbyPlacesStatus;
  final UploadImagePlaceStatus uploadImagePlaceStatus;
  const PlaceState({
    this.place,
    this.placeStatus = PlaceStatus.init,
    this.nearbyPlaces = const [],
    this.nearbyPlacesStatus = NearbyPlacesStatus.init,
    this.uploadImagePlaceStatus = UploadImagePlaceStatus.init,
  });
  PlaceState copyWith({
    PlaceModel? place,
    PlaceStatus? placeStatus,
    List<PlaceModel>? nearbyPlaces,
    NearbyPlacesStatus? nearbyPlacesStatus,
    UploadImagePlaceStatus? uploadImagePlaceStatus,
  }) {
    return PlaceState(
      place: place ?? this.place,
      placeStatus: placeStatus ?? this.placeStatus,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      nearbyPlacesStatus: nearbyPlacesStatus ?? this.nearbyPlacesStatus,
      uploadImagePlaceStatus:
          uploadImagePlaceStatus ?? this.uploadImagePlaceStatus,
    );
  }
}
