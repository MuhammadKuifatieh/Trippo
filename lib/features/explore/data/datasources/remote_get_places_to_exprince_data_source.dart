import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

class RemoteGetPlacesToExperinceDataSource {
  Future<PlacesResponse> getPlacesToExperince(String id) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexPlaces(),
      fromJson: placesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
