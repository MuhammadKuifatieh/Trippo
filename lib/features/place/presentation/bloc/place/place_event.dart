part of 'place_bloc.dart';

abstract class PlaceEvent {
  const PlaceEvent();
}

class GetPlaceEvent extends PlaceEvent {
  final String id;
  GetPlaceEvent({required this.id});
}

class GetNearbyPlacesEvent extends PlaceEvent {
  final String id;

  GetNearbyPlacesEvent({required this.id});
}

class UploadImagePlaceEvent extends PlaceEvent {
  final String id;
  final String imageName;

  UploadImagePlaceEvent({
    required this.id,
    required this.imageName,
  });
}

class ChangeFavoriteStateEvent extends PlaceEvent {
  final String id;

  ChangeFavoriteStateEvent({required this.id});
}

class GetPlaceImagesEvent extends PlaceEvent {
  final String id;
  const GetPlaceImagesEvent({required this.id});
}

class AddReviewToPlaceEvent extends PlaceEvent {
  final AddReviewToPlaceParams params;
  AddReviewToPlaceEvent(this.params);
}

class GetVisitTypesEvent extends PlaceEvent {
  GetVisitTypesEvent();
}

class GetFirstReviewsEvent extends PlaceEvent {
  final String placeId;

  GetFirstReviewsEvent({required this.placeId});
}
