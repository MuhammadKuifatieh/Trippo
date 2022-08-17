import 'dart:async';
import 'package:collection/collection.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/config/global_functions.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../home/data/models/places_response.dart';
import '../../../../place/presentation/pages/place_screen.dart';
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
    on<UpdatePlaceFavoriteInMapEvent>(_mapUpdateFavoriteValue);
  }

  FutureOr<void> _mapUpdateFavoriteValue(
      UpdatePlaceFavoriteInMapEvent event, Emitter<MapState> emit) async {
    emit(
      state.copyWith(
        palces: state.palces
            .mapIndexed(
              (index, element) => (index == event.index)
                  ? element.copyWith(isFavorite: event.isFavorite)
                  : element,
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _mapChangeFilterValue(
      ChangeFitterValueEvent event, Emitter<MapState> emit) async {
    emit(state.copyWith(
      latLngBounds: event.latLngBounds,
      typeIndex: event.index,
    ));
    add(GetPlacesToMapEvent(event.context));
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
      (l) => add(GetTypeToMapEvent()),
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
      typeId:state.types.isEmpty?"1": state.types[state.typeIndex].id.toString(),
      page: 1,
      perPage: 100,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        placeToMapStatus: PlaceToMapStatus.falied,
      )),
      (r) {
        Set<Marker> markers = {};
        for (var item in r.data!.places!) {
          markers.add(
            Marker(
              markerId: MarkerId(item.id.toString()),
              position: LatLng(
                item.latitude!,
                item.longitude!,
              ),
              infoWindow: InfoWindow(
                title: item.name,
                snippet: item.about,
                onTap: () {
                  Navigator.of(event.context)
                      .pushNamed(
                    PlaceScreen.routeName,
                    arguments: PlaceScreenParams(
                      id: item.id.toString(),
                    ),
                  )
                      .then((value) {
                    if (value != null) {
                      bool newVakue = value as bool;
                      var newList = state.palces;
                      for (int i = 0; i < newList.length; i++) {
                        if (item.id == newList[i].id) {
                          newList[i] =
                              newList[i].copyWith(isFavorite: newVakue);
                        }
                      }
                      emit(state.copyWith(
                        palces: newList,
                      ));
                    }
                  });
                },
              ),
            ),
          );
        }
        emit(state.copyWith(
          palces: r.data!.places,
          placeToMapStatus: PlaceToMapStatus.succ,
          markers: markers,
        ));
      },
    );
  }
}
