import '../../../../core/data/models/no_response.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/post_api.dart';
import '../models/add_reviwe_response.dart';

class RemoteAddReviewToPlaceDataSource {
  Future<AddReviewResponse> addReviewToPlace(
      {required String id, required Map<String, dynamic> body}) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.addReviewToPlace(id),
      body: body,
      fromJson: addReviewResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
