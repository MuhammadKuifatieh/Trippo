import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/data/models/places_response.dart';
import '../repositories/map_repository.dart';

class GetPlaceToMap implements UseCase<PlacesResponse, GetPlacesToMapParams> {
  final MapRepository mapRepository;

  GetPlaceToMap({required this.mapRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetPlacesToMapParams params) async {
    return mapRepository.getPlacesToMap(params.getParams());
  }
}

class GetPlacesToMapParams {
  final double northeastLat;
  final double northeastLng;
  final double southwastLng;
  final double southwastLat;
  final String typeId;
  final int page;
  final int perPage;

  GetPlacesToMapParams({
    required this.northeastLat,
    required this.northeastLng,
    required this.southwastLng,
    required this.southwastLat,
    required this.typeId,
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "northeast_lng": northeastLng.toString(),
        "southwest_lng": southwastLng.toString(),
        "northeast_lat": northeastLat.toString(),
        "southwest_lat": southwastLat.toString(),
        "type_id": typeId,
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
