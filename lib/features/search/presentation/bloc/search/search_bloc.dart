import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../home/data/models/cities_response.dart';
import '../../../../home/data/models/places_response.dart';
import '../../../../map/data/models/type_respnse.dart';
import '../../../../place/data/models/visit_types_response.dart';
import '../../../data/models/feature_title_response.dart';
import '../../../data/repositories/search_repository_implement.dart';
import '../../../domin/usecases/get_alll_cities.dart';
import '../../../domin/usecases/get_feature_title_to_search.dart';
import '../../../domin/usecases/get_places_to_search.dart';
import '../../../domin/usecases/get_types_to_search.dart';
import '../../../domin/usecases/get_visit_types.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final _getTypes =
      GetTypesToSearch(searchRepository: SearchRepositoryImplement());
  final _getFeatureTitles =
      GetFeatureTitle(searchRepository: SearchRepositoryImplement());
  final _getVisitTypes =
      GetVisitTypesToSearch(searchRepository: SearchRepositoryImplement());
  final _getCities =
      GetAllCitiesToSearch(searchRepository: SearchRepositoryImplement());
  final _getPlaces =
      GetPlacesToSearch(searchRepository: SearchRepositoryImplement());
  SearchBloc() : super(const SearchState()) {
    on<GetAllInfoToSearchEvent>(_mapGetAllInfo);
    on<GetCitiesToSearchEvent>(_mapGetCitiesState);
    on<GetTypesToSearchEvent>(_mapGetTypesToSearch);
    on<ChangeFiltterSearchEvent>(_mapChangeFiltter);
    on<GetVisitTypeToSearchEvent>(_mapGetVisitTypes);
    on<GetPlacesToSearchEvent>(_mapGetPlacesToSearchState);
    on<GetFeaturTitlesToSearchEvent>(_mapGetFeatureTitlesToSearch);
  }

  FutureOr<void> _mapGetPlacesToSearchState(
      GetPlacesToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        getPlacesToSearchStatus: GetPlacesToSearchStatus.loading));
    final result = await _getPlaces(GetPlacesToSearchParams(
      city: state.selectedIndexCity == -1
          ? null
          : state.cities[state.selectedIndexCity].id.toString(),
      feature: state.selectedIndexFeatureTitle == -1
          ? null
          : state.selectedIndexFeature == -1
              ? null
              : state.featureTitles[state.selectedIndexFeatureTitle]
                  .features![state.selectedIndexFeature].id
                  .toString(),
      name: state.name,
      type: state.selectedIndexType == -1
          ? null
          : state.types[state.selectedIndexType].id.toString(),
      option: state.selectedIndexType == -1
          ? null
          : state.selectedIndexOption == -1
              ? null
              : state.types[state.selectedIndexType]
                  .options![state.selectedIndexOption].id
                  .toString(),
      placeRating: state.selectedIndexRatting == -1
          ? null
          : state.ratting[state.selectedIndexRatting].toString(),
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getPlacesToSearchStatus: GetPlacesToSearchStatus.failed,
      )),
      (r) => emit(state.copyWith(
        getPlacesToSearchStatus: GetPlacesToSearchStatus.succ,
        places: r.data!.places,
      )),
    );
  }

  FutureOr<void> _mapChangeFiltter(
      ChangeFiltterSearchEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
      selectedIndexFeatureTitle: event.selectedIndexFeatureTitle,
      selectedIndexFeature: event.selectedIndexFeatureTitle == -1
          ? -1
          : event.selectedIndexFeature,
      selectedIndexType: event.selectedIndexType,
      selectedIndexOption:
          event.selectedIndexType == -1 ? -1 : event.selectedIndexOption,
      selectedIndexVisitedType: event.selectedIndexVisitedType,
      selectedIndexRatting: event.selectedIndexRatting,
      selectedIndexCity: event.selectedIndexCity,
      name: event.name,
    ));
  }

  FutureOr<void> _mapGetAllInfo(
      GetAllInfoToSearchEvent event, Emitter<SearchState> emit) async {
    add(const GetTypesToSearchEvent());
    add(const GetCitiesToSearchEvent());
    add(const GetVisitTypeToSearchEvent());
    add(const GetFeaturTitlesToSearchEvent());
  }

  FutureOr<void> _mapGetCitiesState(
      GetCitiesToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(citiesStatus: CitiesStatus.loading));
    final result = await _getCities(NoParams());
    result.fold(
      (l) => add(const GetCitiesToSearchEvent()),
      (r) => emit(state.copyWith(
        cities: r,
        citiesStatus: CitiesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetVisitTypes(
      GetVisitTypeToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(visitTypesStatus: VisitTypesStatus.loading));
    final result = await _getVisitTypes(NoParams());
    result.fold(
      (l) => add(const GetVisitTypeToSearchEvent()),
      (r) => emit(state.copyWith(
        visitTypes: r.data!.visitTypes,
        visitTypesStatus: VisitTypesStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetFeatureTitlesToSearch(
      GetFeaturTitlesToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(featureTitleStatus: FeatureTitleStatus.failed));
    final result = await _getFeatureTitles(NoParams());
    result.fold(
      (l) => add(const GetFeaturTitlesToSearchEvent()),
      (r) => emit(state.copyWith(
        featureTitles: r.data!.featureTitles,
        featureTitleStatus: FeatureTitleStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetTypesToSearch(
      GetTypesToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(typesStatus: TypesStatus.loading));
    final result = await _getTypes(NoParams());
    result.fold(
      (l) => add(const GetTypesToSearchEvent()),
      (r) => emit(state.copyWith(
        types: r.data!.types,
        typesStatus: TypesStatus.succ,
      )),
    );
  }
}
