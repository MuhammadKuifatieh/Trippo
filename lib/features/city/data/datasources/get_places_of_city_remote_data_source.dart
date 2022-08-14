import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/place/data/models/place_response.dart';

class GetPlacesOfCityRemoteDataSource {
  Future<List<PlaceOfCityModel>> getPlacesOfCity(
      {required Map<String, dynamic> params}) async {
    GetApi getApiPlacesOfCity = GetApi(
      uri: ApiVariables.getPlacesOfCity(params: params),
      fromJson: (jsonString) {
        final mapJson = jsonDecode(jsonString);
        List places = (mapJson['data'] as List)
            .map((place) => PlaceResponse.fromJson(place["data"]["places"]))
            .toList();
        return places;
      },
    );

    return await getApiPlacesOfCity.callRequest();
  }
}
