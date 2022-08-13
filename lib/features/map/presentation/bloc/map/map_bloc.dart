import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/config/global_functions.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../home/data/models/places_response.dart';
import '../../../data/models/type_respnse.dart';
import '../../../data/repositories/map_repository_implement.dart';
import '../../../domin/usecases/get_places_to_map.dart';
import '../../../domin/usecases/get_types.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final _getPlacesToMap =
      GetPlaceToMap(mapRepository: MapRepositoryImplement());
  final _getTypes = GetTypes(mapRepository: MapRepositoryImplement());
  final int perPage = 10;
  MapBloc() : super(const MapState()) {
    on<GetTypeToMapEvent>(_mapGetTypes);
    on<GetPlacesToMapEvent>(_mapGetPlaces);
    on<GetInitLocationEvent>(_mapInitLocationState);
    on<ChangeFitterValueEvent>(_mapChangeFilterValue);
  }
  FutureOr<void> _mapChangeFilterValue(
      ChangeFitterValueEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(
      latLngBounds: event.latLngBounds,
      typeIndex: event.index,
    ));
    add(GetPlacesToMapEvent());
  }

  FutureOr<void> _mapInitLocationState(
      GetInitLocationEvent event, Emitter<MapState> emit) async {
    final result = await GlobalFunctions().getLocation();
    if (result != null) {
      emit(state.copyWith(
        longitude: result.longitude,
        latitude: result.latitude,
        initLocationStatus: InitLocationStatus.getting,
      ));
      emit(state.copyWith(initLocationStatus: InitLocationStatus.done));
      add(GetTypeToMapEvent());
    } else {
      add(GetInitLocationEvent());
    }
  }

  FutureOr<void> _mapGetTypes(
      GetTypeToMapEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(typesToMapStatus: TypesToMapStatus.loading));
    final result = await _getTypes(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        typesToMapStatus: TypesToMapStatus.falied,
      )),
      (r) {
        emit(state.copyWith(
          types: r.data!.types,
          typesToMapStatus: TypesToMapStatus.succ,
        ));
        emit(state.copyWith(typesToMapStatus: TypesToMapStatus.init));
      },
    );
  }

  FutureOr<void> _mapGetPlaces(
      GetPlacesToMapEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(placeToMapStatus: PlaceToMapStatus.loading));
    final result = await _getPlacesToMap(GetPlacesToMapParams(
      northeastLat: state.latLngBounds!.northeast.latitude,
      northeastLng: state.latLngBounds!.northeast.longitude,
      southwastLng: state.latLngBounds!.southwest.longitude,
      southwastLat: state.latLngBounds!.southwest.latitude,
      typeId: state.types[state.typeIndex].id.toString(),
      page: 1,
      perPage: perPage,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        placeToMapStatus: PlaceToMapStatus.falied,
      )),
      (r) => emit(state.copyWith(
        palces: r.data!.places,
        placeToMapStatus: PlaceToMapStatus.succ,
      )),
    );
  }
}
