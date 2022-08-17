import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trippo/features/place/data/models/reviews_response.dart';
import 'package:trippo/features/place/domin/usecases/get_reviews.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../home/data/models/cities_response.dart';
import '../../../../home/data/models/places_response.dart';
import '../../../data/models/visit_types_response.dart';
import '../../../data/repositories/place_repository_implement.dart';
import '../../../domin/usecases/add_review_to_place.dart';
import '../../../domin/usecases/change_favorite_state.dart';
import '../../../domin/usecases/get_nearby_places.dart';
import '../../../domin/usecases/get_place.dart';
import '../../../domin/usecases/get_place_images.dart';
import '../../../domin/usecases/get_visit_types.dart';
import '../../../domin/usecases/upload_image_place.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final _getPlace = GetPlace(placeRepository: PlaceRepositoryImplement());
  final _getVisitTpes =
      GetVisitTypes(placeRepository: PlaceRepositoryImplement());
  final _getNearbyPlaces =
      GetNearbyPlaces(placeRepository: PlaceRepositoryImplement());
  final _uploadImagePlace =
      UploadImagePlace(placeRepository: PlaceRepositoryImplement());
  final _changeFavoriteState =
      ChangeFavoriteState(placeRepository: PlaceRepositoryImplement());
  final _getPlaceImages =
      GetPlaceImages(placeRepository: PlaceRepositoryImplement());
  final _addReviewToPlace =
      AddReviewToPlace(placeRepository: PlaceRepositoryImplement());
  final _getReviews = GetReviewsToPlace(placeRepository: PlaceRepositoryImplement());

  PlaceBloc() : super(const PlaceState()) {
    on<GetPlaceEvent>(_mapGetPlaceState);

    on<GetPlaceImagesEvent>(_mapGetPlaceImages);

    on<GetNearbyPlacesEvent>(_mapGetNearbyPlaces);

    on<GetFirstReviewsEvent>(_mapGetFirstReviews);

    on<GetVisitTypesEvent>(_mapGetVisitTypesState);

    on<UploadImagePlaceEvent>(_mapUploadImagePlaceState);

    on<AddReviewToPlaceEvent>(_mapAddReviewToPlaceState);

    on<ChangeFavoriteStateEvent>(_mapChangeFavoriteState);
  }

  Future<void> _mapGetFirstReviews(
      GetFirstReviewsEvent event, Emitter<PlaceState> emit) async {
    emit(state.copyWith(reviewsStatus: ReviewsStatus.loading));
    final result = await _getReviews(GetReviewsToPlaceParams(
      page: 1,
      perPage: 5,
      placeId: event.placeId,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        reviewsStatus: ReviewsStatus.failed,
      )),
      (r) => emit(state.copyWith(
        reviewsStatus: ReviewsStatus.succ,
        reviews: r.data!.comments,
        ratting: r.data!.ratting,
      )),
    );
  }

  FutureOr<void> _mapGetVisitTypesState(
      GetVisitTypesEvent event, Emitter<PlaceState> emit) async {
    emit(state.copyWith(visitTypesStatus: VisitTypesStatus.loading));
    final result = await _getVisitTpes(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        visitTypesStatus: VisitTypesStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
          visitTypesStatus: VisitTypesStatus.succ,
          visitTypes: r.data!.visitTypes,
        ));
        emit(state.copyWith(visitTypesStatus: VisitTypesStatus.init));
      },
    );
  }

  FutureOr<void> _mapAddReviewToPlaceState(
      AddReviewToPlaceEvent event, Emitter<PlaceState> emit) async {
    emit(
        state.copyWith(addReviewToPlaceStatus: AddReviewToPlaceStatus.loading));
    final result = await _addReviewToPlace(event.params);
    result.fold(
      (l) => emit(state.copyWith(
        addReviewToPlaceStatus: AddReviewToPlaceStatus.failed,
      )),
      (r) {
        var newList = List.of(state.reviews);
        if (state.reviews.length < 5) {
          newList.insert(0, r.data!.review!);
        } else {
          newList.removeLast();
          newList.insert(0, r.data!.review!);
        }
        emit(state.copyWith(
            addReviewToPlaceStatus: AddReviewToPlaceStatus.succ,
            reviews: newList));

        emit(state.copyWith(
          addReviewToPlaceStatus: AddReviewToPlaceStatus.init,
        ));
      },
    );
  }

  FutureOr<void> _mapGetPlaceImages(
      GetPlaceImagesEvent event, Emitter<PlaceState> emit) async {
    emit(state.copyWith(placeImagesStatus: PlaceImagesStatus.loading));
    final result = await _getPlaceImages(GetPlaceImagesParams(
      id: event.id,
      page: 1,
      perPage: 5,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        placeImagesStatus: PlaceImagesStatus.failed,
      )),
      (r) => emit(state.copyWith(
        placeImagesStatus: PlaceImagesStatus.succ,
        images: r.data!.images,
      )),
    );
  }

  FutureOr<void> _mapChangeFavoriteState(
      ChangeFavoriteStateEvent event, Emitter<PlaceState> emit) async {
    emit(
      state.copyWith(
          place: state.place!.copyWith(
        isFavorite: !state.place!.isFavorite!,
      )),
    );
    final result =
        await _changeFavoriteState(ChangeFavoriteStateParams(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            place: state.place!.copyWith(
          isFavorite: !state.place!.isFavorite!,
        )),
      ),
      (r) => emit(state),
    );
  }

  FutureOr<void> _mapGetPlaceState(
      GetPlaceEvent event, Emitter<PlaceState> emit) async {
    emit(state.copyWith(placeStatus: PlaceStatus.loading));
    final result = await _getPlace(GetPlaceParams(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        placeStatus: PlaceStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
          place: r.data!.place,
          placeStatus: PlaceStatus.succ,
        ));
        add(GetNearbyPlacesEvent(
          id: event.id,
        ));
      },
    );
  }

  FutureOr<void> _mapGetNearbyPlaces(
      GetNearbyPlacesEvent event, Emitter<PlaceState> emit) async {
    emit(state.copyWith(
      nearbyPlacesStatus: NearbyPlacesStatus.loading,
    ));
    final result = await _getNearbyPlaces(GetNearbyPlacesParams(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        nearbyPlacesStatus: NearbyPlacesStatus.failed,
      )),
      (r) => emit(state.copyWith(
        nearbyPlaces: r.data!.places,
        nearbyPlacesStatus: NearbyPlacesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapUploadImagePlaceState(
      UploadImagePlaceEvent event, Emitter<PlaceState> emit) async {
    emit(
        state.copyWith(uploadImagePlaceStatus: UploadImagePlaceStatus.loading));
    final result = await _uploadImagePlace(UploadImagePlaceParams(
      id: event.id,
      imageName: event.imageName,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        uploadImagePlaceStatus: UploadImagePlaceStatus.failed,
      )),
      (r) => emit(
        state.copyWith(
          uploadImagePlaceStatus: UploadImagePlaceStatus.succ,
        ),
      ),
    );
  }
}
