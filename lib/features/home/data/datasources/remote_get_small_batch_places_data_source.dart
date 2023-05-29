import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

class RemoteGetSmallBatchPlacesDataSource {
  Future<PlacesResponse> getSmallBatchPlaces(
      Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexPlaces(queryParameters: params),
      fromJson: placesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
