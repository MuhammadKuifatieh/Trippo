import 'package:trippo/core/data/models/no_response.dart';

import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/post_api.dart';
import '../models/add_experince_response.dart';

class RemoteAddExperinceDataSource {
  Future<NoResponse> addExperince(Map<String, dynamic> body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.addExperince(),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
