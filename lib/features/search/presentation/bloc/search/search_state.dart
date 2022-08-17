part of 'search_bloc.dart';

enum TypesStatus { init, succ, failed, loading }
enum FeatureTitleStatus { init, succ, failed, loading }
enum VisitTypesStatus { init, succ, failed, loading }
enum CitiesStatus { init, succ, failed, loading }
enum GetPlacesToSearchStatus { init, succ, failed, loading }

class SearchState {
  final TypesStatus typesStatus;
  final List<TypeModel> types;
  final List<FeatureTitleModel> featureTitles;
  final FeatureTitleStatus featureTitleStatus;
  final VisitTypesStatus visitTypesStatus;
  final CitiesStatus citiesStatus;
  final List<VisitTypeModel> visitTypes;
  final List<CityModel> cities;
  final List<int> ratting;
  final List<PlaceModel> places;
  final GetPlacesToSearchStatus getPlacesToSearchStatus;

  final int selectedIndexVisitedType;
  final int selectedIndexType;
  final int selectedIndexOption;
  final int selectedIndexFeatureTitle;
  final int selectedIndexFeature;
  final int selectedIndexRatting;
  final int selectedIndexCity;
  final String? name;

  const SearchState({
    this.cities = const [],
    this.ratting = const [1, 2, 3, 4, 5],
    this.typesStatus = TypesStatus.init,
    this.citiesStatus = CitiesStatus.init,
    this.featureTitleStatus = FeatureTitleStatus.init,
    this.visitTypesStatus = VisitTypesStatus.init,
    this.types = const [],
    this.featureTitles = const [],
    this.visitTypes = const [],
    this.selectedIndexFeature = -1,
    this.selectedIndexFeatureTitle = -1,
    this.selectedIndexOption = -1,
    this.selectedIndexType = -1,
    this.selectedIndexVisitedType = -1,
    this.selectedIndexRatting = -1,
    this.selectedIndexCity = -1,
    this.name,
    this.places = const [],
    this.getPlacesToSearchStatus = GetPlacesToSearchStatus.init,
  });
  SearchState copyWith({
    List<TypeModel>? types,
    TypesStatus? typesStatus,
    List<FeatureTitleModel>? featureTitles,
    FeatureTitleStatus? featureTitleStatus,
    VisitTypesStatus? visitTypesStatus,
    CitiesStatus? citiesStatus,
    List<VisitTypeModel>? visitTypes,
    List<CityModel>? cities,
    int? selectedIndexVisitedType,
    int? selectedIndexType,
    int? selectedIndexOption,
    int? selectedIndexFeatureTitle,
    int? selectedIndexFeature,
    int? selectedIndexRatting,
    int? selectedIndexCity,
    String? name,
    GetPlacesToSearchStatus? getPlacesToSearchStatus,
    List<PlaceModel>? places,
  }) {
    return SearchState(
      name: name ?? this.name,
      types: types ?? this.types,
      typesStatus: typesStatus ?? this.typesStatus,
      featureTitles: featureTitles ?? this.featureTitles,
      featureTitleStatus: featureTitleStatus ?? this.featureTitleStatus,
      visitTypes: visitTypes ?? this.visitTypes,
      visitTypesStatus: visitTypesStatus ?? this.visitTypesStatus,
      selectedIndexFeature: selectedIndexFeature ?? this.selectedIndexFeature,
      selectedIndexFeatureTitle:
          selectedIndexFeatureTitle ?? this.selectedIndexFeatureTitle,
      selectedIndexOption: selectedIndexOption ?? this.selectedIndexOption,
      selectedIndexType: selectedIndexType ?? this.selectedIndexType,
      selectedIndexVisitedType:
          selectedIndexVisitedType ?? this.selectedIndexVisitedType,
      selectedIndexRatting: selectedIndexRatting ?? this.selectedIndexRatting,
      cities: cities ?? this.cities,
      citiesStatus: citiesStatus ?? this.citiesStatus,
      selectedIndexCity: selectedIndexCity ?? this.selectedIndexCity,
      places: places ?? this.places,
      getPlacesToSearchStatus:
          getPlacesToSearchStatus ?? this.getPlacesToSearchStatus,
    );
  }
}
