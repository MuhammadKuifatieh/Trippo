import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

class RemoteGetMightLikePlacesDataSource {
  Future<PlacesResponse> getMightLikePlaces(
      Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexMostFavorite(queryParameters: params),
      fromJson: placesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
