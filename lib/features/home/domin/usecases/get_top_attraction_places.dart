import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/places_response.dart';
import '../repositories/home_repository.dart';

class GetTopAttractionPlaces
    implements UseCase<PlacesResponse, GetTopAttractionPlacesParams> {
  final HomeRepository homeRepository;

  GetTopAttractionPlaces({required this.homeRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetTopAttractionPlacesParams params) {
    return homeRepository.getTopAttracyionPlaces(params.getParams());
  }
}

class GetTopAttractionPlacesParams {
  final int page;
  final int perPage;
  final int? typeId;
  final int? cityId;

  GetTopAttractionPlacesParams({
    required this.page,
    required this.perPage,
    this.cityId,
    this.typeId,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
        'filter[city_id]': cityId.toString(),
        'filter[type_id]': typeId.toString(),
      };
}
