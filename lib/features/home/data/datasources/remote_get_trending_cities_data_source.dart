import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/cities_response.dart';

class RemoteGetTrendingCitiesDataSource {
  Future<CitiesResponse> getTrending(Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getTrendingCity(queryParameters: params),
      fromJson: citiesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
