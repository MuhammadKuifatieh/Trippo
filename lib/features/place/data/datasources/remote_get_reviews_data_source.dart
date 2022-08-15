import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/reviews_response.dart';

class RemoteGetReviewsDataSource {
  Future<ReviewsResponse> getReviews(Map<String, dynamic> params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getReviews(params),
      fromJson: reviewsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
