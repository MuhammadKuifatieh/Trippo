import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../home/data/models/places_response.dart';

class RemoteGetNearbyPlacesDataSource {
  Future<PlacesResponse> getNearbyPlaces(String id) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexNearByPlaces(id: id),
      fromJson: placesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
