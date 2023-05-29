part of 'place_bloc.dart';

enum PlaceStatus { init, succ, loading, failed }
enum NearbyPlacesStatus { init, succ, loading, failed }
enum UploadImagePlaceStatus { init, succ, loading, failed }
enum PlaceImagesStatus { init, succ, loading, failed }
enum AddReviewToPlaceStatus { init, succ, loading, failed }
enum VisitTypesStatus { init, succ, loading, failed }
enum ReviewsStatus { init, succ, loading, failed }

class PlaceState {
  final PlaceModel? place;
  final List<PlaceModel> nearbyPlaces;
  final PlaceStatus placeStatus;
  final PlaceImagesStatus placeImagesStatus;
  final List<ImageModel> images;
  final NearbyPlacesStatus nearbyPlacesStatus;
  final UploadImagePlaceStatus uploadImagePlaceStatus;
  final AddReviewToPlaceStatus addReviewToPlaceStatus;
  final VisitTypesStatus visitTypesStatus;
  final List<VisitTypeModel> visitTypes;
  final ReviewsStatus reviewsStatus;
  final List<ReviewModel> reviews;
  final List<RattingModel> ratting;
  const PlaceState({
    this.place,
    this.images = const [],
    this.visitTypes = const [],
    this.placeStatus = PlaceStatus.init,
    this.nearbyPlaces = const [],
    this.reviews = const [],
    this.ratting = const [],
    this.reviewsStatus = ReviewsStatus.init,
    this.visitTypesStatus = VisitTypesStatus.init,
    this.placeImagesStatus = PlaceImagesStatus.init,
    this.nearbyPlacesStatus = NearbyPlacesStatus.init,
    this.uploadImagePlaceStatus = UploadImagePlaceStatus.init,
    this.addReviewToPlaceStatus = AddReviewToPlaceStatus.init,
  });
  PlaceState copyWith({
    PlaceModel? place,
    PlaceStatus? placeStatus,
    List<ReviewModel>? reviews,
    List<RattingModel>? ratting,
    List<ImageModel>? images,
    ReviewsStatus? reviewsStatus,
    List<PlaceModel>? nearbyPlaces,
    List<VisitTypeModel>? visitTypes,
    VisitTypesStatus? visitTypesStatus,
    PlaceImagesStatus? placeImagesStatus,
    NearbyPlacesStatus? nearbyPlacesStatus,
    UploadImagePlaceStatus? uploadImagePlaceStatus,
    AddReviewToPlaceStatus? addReviewToPlaceStatus,
  }) {
    return PlaceState(
      place: place ?? this.place,
      images: images ?? this.images,
      reviews: reviews ?? this.reviews,
      ratting: ratting ?? this.ratting,
      visitTypes: visitTypes ?? this.visitTypes,
      placeStatus: placeStatus ?? this.placeStatus,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      reviewsStatus: reviewsStatus ?? this.reviewsStatus,
      visitTypesStatus: visitTypesStatus ?? this.visitTypesStatus,
      placeImagesStatus: placeImagesStatus ?? this.placeImagesStatus,
      nearbyPlacesStatus: nearbyPlacesStatus ?? this.nearbyPlacesStatus,
      uploadImagePlaceStatus:
          uploadImagePlaceStatus ?? this.uploadImagePlaceStatus,
      addReviewToPlaceStatus:
          addReviewToPlaceStatus ?? this.addReviewToPlaceStatus,
    );
  }
}
