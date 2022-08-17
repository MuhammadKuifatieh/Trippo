import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/experince_detailes_response.dart';

class RemoteGetExperinceDetailesDataSource {
  Future<ExperienceDetailesResponse> getExperinceDetailes(String id) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getExperinceDetailes(id),
      fromJson: experienceDetailesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
