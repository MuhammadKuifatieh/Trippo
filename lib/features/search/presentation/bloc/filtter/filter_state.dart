part of 'filter_bloc.dart';

enum FilterStatus {
  initial,
  deleteSelectedItem,
  addSelectedItem,
  clearFilter,
}

class FilterState {
  FilterState({
    this.status = FilterStatus.initial,
    this.ratingData = const [],
    this.filterTitle = const [],
    this.select = false,
    this.reviewDate = const [],
    this.timeOfYear = const [],
    this.typeOfVisit = const [],
    this.typeOfVisit2 = const [],
    this.typeOfVisit3 = const [],
    this.dataData= const{},
  });
  List<dynamic> reviewDate;
  List<String> timeOfYear;
  List<String> typeOfVisit;
  List<String> typeOfVisit2;
  List<String> typeOfVisit3;
  List<dynamic> ratingData;
  List<String> filterTitle;
  final bool select;
  final FilterStatus status;
  Map<String,int> dataData;

  FilterState copyWith({
    final List<dynamic>? ratingData,
    final List<dynamic>? reviewDate,
    final List<String>? timeOfYear,
    final List<String>? typeOfVisit,
    final List<String>? typeOfVisit2,
    final List<String>? typeOfVisit3,
    final List<String>? filterTitle,
    final FilterStatus? status,
    final bool? select,
  final Map<String,int>? dataData,

  }) {
    return FilterState(
      ratingData: ratingData ?? this.ratingData,
      select: select ?? this.select,
      filterTitle: filterTitle ?? this.filterTitle,
      status: status ?? this.status,
      reviewDate: reviewDate ?? this.reviewDate,
      timeOfYear: timeOfYear ?? this.timeOfYear,
      typeOfVisit2: typeOfVisit2 ?? this.typeOfVisit2,
      typeOfVisit3: typeOfVisit3 ?? this.typeOfVisit3,
      typeOfVisit: typeOfVisit ?? this.typeOfVisit,
      dataData:dataData??this.dataData, 
    );
  }
}
