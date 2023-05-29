import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/features/search/data/models/feature_title_response.dart';

class RemoteGetFeatureTitleDataSource {
  Future<FeatureTitleResponse> getFeatureTitle() async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getFeatureTitle(),
      fromJson: featureTitleResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
