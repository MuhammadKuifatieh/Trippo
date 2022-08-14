import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/city/domain/usecases/get_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_places_of_city_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc({
    required GetCityUseCase getCityByIdUseCase,
    required GetPlacesOfCityUseCase getPlacesOfCityUseCase,
   
  })  : _getCityByIdUseCase = getCityByIdUseCase,
        _getPlacesOfCityUseCase = getPlacesOfCityUseCase,
        super(const CityState()) {
    on<CityEvent>((event, emit) {});
    on<GetCityEvent>(_mapFetchCityEvent);
    on<GetPlacesOfCityEvent>(_mapGetPlacesOfCityEvent);
   
  }
  final GetCityUseCase _getCityByIdUseCase;
  final GetPlacesOfCityUseCase _getPlacesOfCityUseCase;
 

  _mapFetchCityEvent(
      GetCityEvent event, Emitter<CityState> emit) async {
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

 

 
}
