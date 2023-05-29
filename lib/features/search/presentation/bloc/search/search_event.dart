part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class GetPlacesToSearchEvent extends SearchEvent {
  const GetPlacesToSearchEvent();
}

class ChangeFiltterSearchEvent extends SearchEvent {
  final int? selectedIndexVisitedType;
  final int? selectedIndexType;
  final int? selectedIndexOption;
  final int? selectedIndexFeatureTitle;
  final int? selectedIndexFeature;
  final int? selectedIndexRatting;
  final int? selectedIndexCity;
  final String? name;

  ChangeFiltterSearchEvent({
    this.selectedIndexFeatureTitle,
    this.selectedIndexVisitedType,
    this.selectedIndexOption,
    this.selectedIndexFeature,
    this.selectedIndexRatting,
    this.selectedIndexType,
    this.selectedIndexCity,
    this.name,
  });
}

class GetAllInfoToSearchEvent extends SearchEvent {
  const GetAllInfoToSearchEvent();
}

class GetTypesToSearchEvent extends SearchEvent {
  const GetTypesToSearchEvent();
}

class GetFeaturTitlesToSearchEvent extends SearchEvent {
  const GetFeaturTitlesToSearchEvent();
}

class GetVisitTypeToSearchEvent extends SearchEvent {
  const GetVisitTypeToSearchEvent();
}

class GetCitiesToSearchEvent extends SearchEvent {
  const GetCitiesToSearchEvent();
}
