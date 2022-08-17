import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/explore/data/models/experienes_response.dart';

class RemoteGetExperiencesDataSource {
  Future<ExperiencesResponse> getExperiences(
      Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getExperiences(params),
      fromJson: experiencesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
