import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/reviews_response.dart';

class RemoteGetReviewsDataSource {
  Future<ReviewsResponse> getReviews(
      String id, Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getReviewsToPlace(id, params),
      fromJson: reviewsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
