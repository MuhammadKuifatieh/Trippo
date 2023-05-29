import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/place_response.dart';

class RemoteGetPlaceDataSource {
  Future<PlaceResponse> getPlace(String id) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getPlace(id),
      fromJson: placeResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
