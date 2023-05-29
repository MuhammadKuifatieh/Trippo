import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../home/data/models/places_response.dart';
import '../repositories/search_repository.dart';

class GetPlacesToSearch
    implements UseCase<PlacesResponse, GetPlacesToSearchParams> {
  final SearchRepository searchRepository;

  GetPlacesToSearch({required this.searchRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(
      GetPlacesToSearchParams params) async {
    return searchRepository.getPlaces(params.getParams());
  }
}

class GetPlacesToSearchParams {
  final String? city;
  final String? type;
  final String? option;
  final String? feature;
  final String? placeRating;
  final String? featureTitle;
  final String? name;

  GetPlacesToSearchParams({
    this.city,
    this.type,
    this.option,
    this.feature,
    this.placeRating,
    this.featureTitle,
    this.name,
  });
  Map<String, dynamic> getParams() {
    return {
      if (placeRating != null) "placeRating": placeRating,
      if (feature != null) "feature_id": feature,
      if (type != null) "type_id": type,
      if (option != null) "option_id": option,
      if (city != null) "city_id": city,
      if (name != null && name!.isNotEmpty) "name": name,
    };
  }
}
