import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/place/data/models/visit_types_response.dart';

class RemoteGetVisitTypesDataSource {
  Future<VisitTypesResponse> getVisitTypes() async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getVisitTypes(),
      fromJson: visitTypesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
