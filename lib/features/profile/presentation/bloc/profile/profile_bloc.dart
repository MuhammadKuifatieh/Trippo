import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:trippo/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:trippo/features/authentication/domain/use_cases/send_host_request_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/home/data/repositories/home_repository_implement.dart';
import 'package:trippo/features/home/domin/usecases/get_all_cities_use_case.dart';

import '../../../../home/data/models/places_response.dart';
import '../../../data/repositories/profile_repository_implement.dart';
import '../../../domin/usecases/get_favorite_place.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _getFavaoritePlaces =
      GetFavoritePlaces(profileRepository: ProfileRepositoryImplement());
  final _getAllCities = GetAllCitiesUseCase(HomeRepositoryImplement());
  final _sendHostUseCase =
      SendHostUseCase(authenticationRepository: AuthenticationRepostitoryImp());
  final perPage = 10;
  ProfileBloc() : super(const ProfileState()) {
    on<GetFavoritePlacesEvent>(
      _mapGetFavoritePlaces,
      transformer: sequential(),
    );
    on<GetAllCities>(_mapGetAllCities);
    on<HostRequestSended>(_mapHostRequestSended);
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

  FutureOr<void> _mapGetAllCities(
      GetAllCities event, Emitter<ProfileState> emit) async {
    final result = await _getAllCities(GetAllCitiesParams(
      page: 1,
      perPage: 100,
    ));

    await result.fold(
      (l) async {},
      (cities) async {
        emit(state.copyWith(cities: cities));
      },
    );
  }

  FutureOr<void> _mapHostRequestSended(
      HostRequestSended event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(sendingRequestStatus: SendingRequestStatus.loading));
    final result = await _sendHostUseCase(event.sendHostParams);

    await result.fold(
      (l) async {
        emit(state.copyWith(sendingRequestStatus: SendingRequestStatus.falied));
      },
      (res) async {
        emit(state.copyWith(sendingRequestStatus: SendingRequestStatus.succ));
      },
    );
  }
}
