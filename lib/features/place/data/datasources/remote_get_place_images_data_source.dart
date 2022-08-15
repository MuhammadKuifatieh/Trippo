import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/place/data/models/images_reponse.dart';

class RemoteGetPlaceImagesDataSource {
  Future<ImagesResponse> getPlaceImages({
    required String id,
    required Map<String, dynamic> params,
  }) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.indexPlaceImages(id, params),
      fromJson: imagesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
