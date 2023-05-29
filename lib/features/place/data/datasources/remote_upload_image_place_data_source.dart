import '../../../../core/data/models/no_response.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/post_api.dart';

class RemoteUploadImagePlaceDataSource {
  Future<NoResponse> uploadImagePlace({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.uploadImagePlace(id),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
