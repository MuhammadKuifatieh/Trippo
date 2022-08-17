import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';

import '../../../data/models/cities_response.dart';
import '../../../data/models/places_response.dart';
import '../../../data/repositories/home_repository_implement.dart';
import '../../../domin/usecases/get_might_like_places.dart';
import '../../../domin/usecases/get_recent_viewed_places.dart';
import '../../../domin/usecases/get_small_batch_places.dart';
import '../../../domin/usecases/get_top_attraction_places.dart';
import '../../../domin/usecases/get_trending_cities.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _getTrendingCities = GetTrendingCities(HomeRepositoryImplement());
  final _getRecentlyViewedPlaces =
      GetRecentlyViewedPlaces(homeRepository: HomeRepositoryImplement());
  final _getMightLikePlaces =
      GetMightLikePlaces(homeRepository: HomeRepositoryImplement());
  final _getSmallBatchPlaces =
      GetSmallBatchPlaces(homeRepository: HomeRepositoryImplement());
  final _getTopAttractionPlaces =
      GetTopAttractionPlaces(homeRepository: HomeRepositoryImplement());
  HomeBloc() : super(const HomeState()) {
    on<GetHomeInfoEvent>(_mapGetHomeInfoState);

    on<GetTrendingCitiesEvent>(_mapGetTrendingCitiesState);

    on<GetRecentlyViewedPlacesEvent>(_mapGetRecentlyViewedPlaces);

    on<GetMightLikePlacesEvent>(_mapGetMightLickPlacesState);

    on<GetSmallBatchPlacesEvent>(_mapGetSmallBatchPlacesState);

    on<GetTopAttractionPlacesEvent>(_mapGetTopAttractionPlacesState);

    on<UpdateRecentlyViewedPlaceFavoriteEvent>(
        _mapUpdateRecentlyViewedPlaceFavoriteState);
    on<UpdateMightLikePlaceFavoriteEvent>(
        _mapUpdateMightLikePlaceFavoriteState);
    on<UpdateSmallBatchPlaceFavoriteEvent>(_mapUpdateSmallBatchPlaceValueState);
    on<UpdateTopAttractionPlaceFavoriteEvent>(
        _mapUpdateTopAttractionPlaceFavoriteSatet);
  }

  FutureOr<void> _mapGetHomeInfoState(
      GetHomeInfoEvent event, Emitter<HomeState> emit) async {
    add(const GetTrendingCitiesEvent());
    add(const GetMightLikePlacesEvent());
    add(const GetSmallBatchPlacesEvent());
    add(const GetTopAttractionPlacesEvent());
    add(const GetRecentlyViewedPlacesEvent());
  }

  FutureOr<void> _mapGetMightLickPlacesState(
      GetMightLikePlacesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(mightLikePlacesStatus: MightLikePlacesStatus.loading));
    final result = await _getMightLikePlaces(GetMightLikePlacesParams(
      page: 0,
      perPage: 10,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        mightLikePlacesStatus: MightLikePlacesStatus.falied,
      )),
      (r) => emit(state.copyWith(
        mightLikePlaces: r.data!.places,
        mightLikePlacesStatus: MightLikePlacesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapUpdateRecentlyViewedPlaceFavoriteState(
      UpdateRecentlyViewedPlaceFavoriteEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        recentlyViewedPalces: state.recentlyViewedPalces
            .mapIndexed(
              (index, element) => (index == event.index)
                  ? element.copyWith(isFavorite: event.favoriteValue)
                  : element,
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _mapUpdateMightLikePlaceFavoriteState(
      UpdateMightLikePlaceFavoriteEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        mightLikePlaces: state.mightLikePlaces
            .mapIndexed(
              (index, element) => (index == event.index)
                  ? element.copyWith(isFavorite: event.favoriteValue)
                  : element,
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _mapUpdateSmallBatchPlaceValueState(
      UpdateSmallBatchPlaceFavoriteEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        smallBatchPlaces: state.smallBatchPlaces
            .mapIndexed(
              (index, element) => (index == event.index)
                  ? element.copyWith(isFavorite: event.favoriteValue)
                  : element,
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _mapUpdateTopAttractionPlaceFavoriteSatet(
      UpdateTopAttractionPlaceFavoriteEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        topAttractionPlaces: state.topAttractionPlaces
            .mapIndexed(
              (index, element) => (index == event.index)
                  ? element.copyWith(isFavorite: event.favoriteValue)
                  : element,
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _mapGetSmallBatchPlacesState(
      GetSmallBatchPlacesEvent event, Emitter<HomeState> emit) async {
    emit(
        state.copyWith(smallBatchPlacesStatus: SmallBatchPlacesStatus.loading));
    final result =
        await _getSmallBatchPlaces(GetSmallBatchParams(page: 0, perPage: 10));
    result.fold(
      (l) => emit(state.copyWith(
        smallBatchPlacesStatus: SmallBatchPlacesStatus.falied,
      )),
      (r) => emit(state.copyWith(
        smallBatchPlaces: r.data!.places,
        smallBatchPlacesStatus: SmallBatchPlacesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetRecentlyViewedPlaces(
      GetRecentlyViewedPlacesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        recentlyViewedPlacesStatus: RecentlyViewedPlacesStatus.loading));
    final result = await _getRecentlyViewedPlaces(GetRecentlyViewedPlacesParams(
      page: 1,
      perPage: 10,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        recentlyViewedPlacesStatus: RecentlyViewedPlacesStatus.falied,
      )),
      (r) => emit(state.copyWith(
        recentlyViewedPlacesStatus: RecentlyViewedPlacesStatus.succ,
        recentlyViewedPalces: r.data!.places,
      )),
    );
  }

  FutureOr<void> _mapGetTopAttractionPlacesState(
      GetTopAttractionPlacesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        topAttractionPlacesStatus: TopAttractionPlacesStatus.loading));
    final result = await _getTopAttractionPlaces(
        GetTopAttractionPlacesParams(page: 1, perPage: 10));
    result.fold(
      (l) => emit(state.copyWith(
        topAttractionPlacesStatus: TopAttractionPlacesStatus.falied,
      )),
      (r) => emit(state.copyWith(
        topAttractionPlaces: r.data!.places,
        topAttractionPlacesStatus: TopAttractionPlacesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetTrendingCitiesState(
      GetTrendingCitiesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(trendingCitiesStatus: TrendingCitiesStatus.loading));
    final result = await _getTrendingCities(GetTrendingCitiesParams(
      page: 1,
      perPage: 10,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        trendingCitiesStatus: TrendingCitiesStatus.falied,
      )),
      (r) => emit(state.copyWith(
        trendingCities: r.data!.cities,
        trendingCitiesStatus: TrendingCitiesStatus.succ,
      )),
    );
  }
}
