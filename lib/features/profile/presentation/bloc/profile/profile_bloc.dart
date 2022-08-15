import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../home/data/models/places_response.dart';
import '../../../data/repositories/profile_repository_implement.dart';
import '../../../domin/usecases/get_favorite_place.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _getFavaoritePlaces =
      GetFavoritePlaces(profileRepository: ProfileRepositoryImplement());
  final perPage = 10;
  ProfileBloc() : super(const ProfileState()) {
    on<GetFavoritePlacesEvent>(
      _mapGetFavoritePlaces,
      transformer: sequential(),
    );
  }
  FutureOr<void> _mapGetFavoritePlaces(
      GetFavoritePlacesEvent event, Emitter<ProfileState> emit) async {
    if (state.favoritePlacesStatus == FavoritePlacesStatus.init ||
        event.isReload) {
      emit(state.copyWith(favoritePlacesStatus: FavoritePlacesStatus.loading));
      final result = await _getFavaoritePlaces(GetFavoritePlacesParams(
        page: 1,
        perPage: perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          favoritePlacesStatus: FavoritePlacesStatus.falied,
        )),
        (r) => emit(state.copyWith(
          favoritePlaces: r.data!.places,
          isEndFavoritePlaces: r.data!.places!.length < perPage,
          favoritePlacesStatus: FavoritePlacesStatus.succ,
        )),
      );
    } else if (!state.isEndFavoritePlaces) {
      emit(state.copyWith(favoritePlacesStatus: FavoritePlacesStatus.loading));
      final result = await _getFavaoritePlaces(GetFavoritePlacesParams(
        page: state.favoritePlaces.length ~/ perPage,
        perPage: perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          favoritePlacesStatus: FavoritePlacesStatus.falied,
        )),
        (r) => emit(state.copyWith(
          favoritePlaces: List.of(state.favoritePlaces)
            ..addAll(r.data!.places!),
          isEndFavoritePlaces: r.data!.places!.length < perPage,
          favoritePlacesStatus: FavoritePlacesStatus.succ,
        )),
      );
    }
  }
}
