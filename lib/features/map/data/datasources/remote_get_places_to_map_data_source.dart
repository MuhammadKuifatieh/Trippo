import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../home/data/models/places_response.dart';

class RemoteGetPlacesToMapDataSource {
  Future<PlacesResponse> getPlacesToMap(Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexPlaceToMap(params),
      fromJson: placesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
