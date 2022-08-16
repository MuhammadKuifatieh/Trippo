import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:trippo/features/city/data/repositories/city_repository_impl.dart';
import 'package:trippo/features/city/domain/usecases/get_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_places_of_city_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/home/data/models/places_response.dart';
import 'package:trippo/features/home/domin/usecases/get_all_cities_use_case.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/data/repository/plans_repository_impl.dart';
import 'package:trippo/features/plans/domain/use_cases/get_all_plans_use_case.dart';

import '../../../domain/usecases/add_question_use_case.dart';

part 'city_event.dart';
part 'city_state.dart';

const throttleDuration = Duration(milliseconds: 200);
const pageSize = 10;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const CityState()) {
    on<CityEvent>((event, emit) {});
    on<GetCityEvent>(_mapFetchCityEvent);
    on<GetPlacesOfCityEvent>(_mapGetPlacesOfCityEvent);
    on<QuestionAdded>(_mapQuestionAdded);
    on<PublicPlansFetched>(
      _mapPublicPlansFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final GetCityUseCase _getCityByIdUseCase =
      GetCityUseCase(getCityRepository: CityRepositoryImpl());
  final GetPlacesOfCityUseCase _getPlacesOfCityUseCase =
      GetPlacesOfCityUseCase(getCityRepository: CityRepositoryImpl());
  final _addQuestionUseCase =
      AddQuestionUseCase(cityRepository: CityRepositoryImpl());
  final _getAllPlansUseCase =
      GetAllPlansUseCase(plansRepository: PlansRepositoryImpl());

  _mapFetchCityEvent(GetCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(cityStatus: GetCityStatus.loading));
    final _fetchedResult =
        await _getCityByIdUseCase(GetCityParams(id: event.cityId));
    _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(cityStatus: GetCityStatus.failure),
      ),
      (city) => emit(
        state.copyWith(city: city, cityStatus: GetCityStatus.success),
      ),
    );
  }

  _mapGetPlacesOfCityEvent(
      GetPlacesOfCityEvent event, Emitter<CityState> emit) async {
    emit(state.copyWith(placesOfCityStatus: GetPlacesOfCityStatus.loading));
    final _fetchedResult = await _getPlacesOfCityUseCase(
        GetPlacesOfCityParams(cityId: event.cityId));
    _fetchedResult.fold(
      (fail) => emit(
        state.copyWith(placesOfCityStatus: GetPlacesOfCityStatus.failure),
      ),
      (places) => emit(
        state.copyWith(
            placesOfCity: places,
            placesOfCityStatus: GetPlacesOfCityStatus.success),
      ),
    );
  }

  FutureOr<void> _mapQuestionAdded(
      QuestionAdded event, Emitter<CityState> emit) async {
    emit(state.copyWith(questionAddingStatus: QuestionAddingStatus.loading));

    final result = await _addQuestionUseCase(event.params);
    await result.fold(
      (l) async {
        emit(
            state.copyWith(questionAddingStatus: QuestionAddingStatus.failure));
      },
      (r) async {
        emit(
            state.copyWith(questionAddingStatus: QuestionAddingStatus.success));
      },
    );
    emit(state.copyWith(questionAddingStatus: QuestionAddingStatus.initial));
  }

  FutureOr<void> _mapPublicPlansFetched(
      PublicPlansFetched event, Emitter<CityState> emit) async {
    if (state.hasReachedMax) return;
    final result = await _getAllPlansUseCase(
      GetAllPlansParams(
        cityId: event.cityId,
        page: (state.plans.length ~/ pageSize) + 1,
        perPage: pageSize,
      ),
    );

    await result.fold(
      (l) async {
        emit(state.copyWith(fetchingStatus: FetchingStatus.failure));
      },
      (newPlans) async {
        emit(state.copyWith(
          fetchingStatus: FetchingStatus.success,
          plans: List.of(state.plans)..addAll(newPlans),
          hasReachedMax: newPlans.length < pageSize,
        ));
      },
    );
  }
}
