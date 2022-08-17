import 'dart:convert';

import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/cities_response.dart';

class AllCitiesDataSource {
  Future<List<CityModel>> getAllCities(Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getAllCities(queryParameters: params),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        final jsonList = jsonMap['data']['cities'] as List<dynamic>;
        return jsonList.map<CityModel>((json) {
          return CityModel.fromJson(json);
        }).toList();
      },
    );
    final result = await getApi.callRequest();
    return result;
  }
}
