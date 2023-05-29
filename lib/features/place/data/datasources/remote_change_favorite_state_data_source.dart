import '../../../../core/data/models/no_response.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/post_api.dart';

class RemoteChangeFavoriteStateDataSource {
  Future<NoResponse> changeFavoriteState(String id) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.changeFavoriteState(id),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
