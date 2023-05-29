import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

class GetCityRemoteDataSource {
  Future<CityModel> getCity({required Map<String, dynamic> params}) async {
    GetApi getApiCity = GetApi(
      uri: ApiVariables.getCity(params: params),
      
      fromJson: (String json) => CityModel.fromJson(jsonDecode(json)["data"]["city"]),
    );

    return await getApiCity.callRequest();
  }
}
