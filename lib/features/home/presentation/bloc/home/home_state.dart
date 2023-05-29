part of 'home_bloc.dart';

enum TrendingCitiesStatus { init, loading, succ, falied }
enum MightLikePlacesStatus { init, loading, succ, falied }
enum RecentlyViewedPlacesStatus { init, loading, succ, falied }
enum SmallBatchPlacesStatus { init, loading, succ, falied }
enum TopAttractionPlacesStatus { init, loading, succ, falied }

class HomeState {
  final RecentlyViewedPlacesStatus recentlyViewedPlacesStatus;
  final List<PlaceModel> recentlyViewedPalces;
  final MightLikePlacesStatus mightLikePlacesStatus;
  final List<PlaceModel> mightLikePlaces;
  final SmallBatchPlacesStatus smallBatchPlacesStatus;
  final List<PlaceModel> smallBatchPlaces;
  final TopAttractionPlacesStatus topAttractionPlacesStatus;
  final List<PlaceModel> topAttractionPlaces;
  final TrendingCitiesStatus trendingCitiesStatus;
  final List<CityModel> trendingCities;
  const HomeState({
    this.recentlyViewedPalces = const [],
    this.recentlyViewedPlacesStatus = RecentlyViewedPlacesStatus.init,
    this.trendingCities = const [],
    this.trendingCitiesStatus = TrendingCitiesStatus.init,
    this.mightLikePlaces = const [],
    this.mightLikePlacesStatus = MightLikePlacesStatus.init,
    this.smallBatchPlaces = const [],
    this.smallBatchPlacesStatus = SmallBatchPlacesStatus.init,
    this.topAttractionPlaces = const [],
    this.topAttractionPlacesStatus = TopAttractionPlacesStatus.init,
  });
  HomeState copyWith({
    RecentlyViewedPlacesStatus? recentlyViewedPlacesStatus,
    List<PlaceModel>? recentlyViewedPalces,
    TrendingCitiesStatus? trendingCitiesStatus,
    List<CityModel>? trendingCities,
    MightLikePlacesStatus? mightLikePlacesStatus,
    SmallBatchPlacesStatus? smallBatchPlacesStatus,
    TopAttractionPlacesStatus? topAttractionPlacesStatus,
    List<PlaceModel>? mightLikePlaces,
    List<PlaceModel>? smallBatchPlaces,
    List<PlaceModel>? topAttractionPlaces,
  }) {
    return HomeState(
      trendingCities: trendingCities ?? this.trendingCities,
      trendingCitiesStatus: trendingCitiesStatus ?? this.trendingCitiesStatus,
      recentlyViewedPalces: recentlyViewedPalces ?? this.recentlyViewedPalces,
      recentlyViewedPlacesStatus:
          recentlyViewedPlacesStatus ?? this.recentlyViewedPlacesStatus,
      mightLikePlaces: mightLikePlaces ?? this.mightLikePlaces,
      mightLikePlacesStatus:
          mightLikePlacesStatus ?? this.mightLikePlacesStatus,
      smallBatchPlaces: smallBatchPlaces ?? this.smallBatchPlaces,
      smallBatchPlacesStatus:
          smallBatchPlacesStatus ?? this.smallBatchPlacesStatus,
      topAttractionPlaces: topAttractionPlaces ?? this.topAttractionPlaces,
      topAttractionPlacesStatus:
          topAttractionPlacesStatus ?? this.topAttractionPlacesStatus,
    );
  }
}
