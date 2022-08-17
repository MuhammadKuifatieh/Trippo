import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../map/data/models/type_respnse.dart';

class RemoteGetTypesDataSource {
  Future<TypesResponse> getTypes() async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getTypes(),
      fromJson: typesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
