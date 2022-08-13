import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../home/data/models/places_response.dart';
import '../../../data/repositories/place_repository_implement.dart';
import '../../../domin/usecases/change_favorite_state.dart';
import '../../../domin/usecases/get_nearby_places.dart';
import '../../../domin/usecases/get_place.dart';
import '../../../domin/usecases/upload_image_place.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final _getPlace = GetPlace(placeRepository: PlaceRepositoryImplement());
  final _getNearbyPlaces =
      GetNearbyPlaces(placeRepository: PlaceRepositoryImplement());
  final _uploadImagePlace =
      UploadImagePlace(placeRepository: PlaceRepositoryImplement());
  final _changeFavoriteState =
      ChangeFavoriteState(placeRepository: PlaceRepositoryImplement());

  PlaceBloc() : super(const PlaceState()) {
    on<GetPlaceEvent>(_mapGetPlaceState);

    on<GetNearbyPlacesEvent>(_mapGetNearbyPlaces);

    on<UploadImagePlaceEvent>(_mapUploadImagePlaceState);
    
    on<ChangeFavoriteStateEvent>(_mapChangeFavoriteState);
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
