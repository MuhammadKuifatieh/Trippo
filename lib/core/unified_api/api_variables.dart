import 'dart:developer';

class ApiVariables {
  ApiVariables._();

  static const _scheme = 'http';
  static const _host = '192.168.137.1';
  static const _port = 5000;

  static Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: _port,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

  static Uri uploadImageBase64() => _mainUri(path: "image/uploadBase64");

  static Uri _mobileUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    return _mainUri(
      path: "mobile/$path",
      queryParameters: queryParameters,
    );
  }

  static Uri registerUri({Map<String, dynamic>? queryParameters}) {
    return _mainUri(
        path: 'auth/user/register', queryParameters: queryParameters);
  }

  static Uri loginUri({Map<String, dynamic>? queryParameters}) {
    return _mainUri(path: 'auth/user/login', queryParameters: queryParameters);
  }

  static Uri updateProfile({String? id}) {
    return _mainUri(path: 'auth/user/update/$id');
  }

  static Uri getTypes() => _mobileUri(path: "type/index");

  //////////
  ///Home///
  //////////
  static Uri getTrendingCity({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "city/indexTrending",
        queryParameters: queryParameters,
      );
  static Uri getAllCities({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "city/index",
        queryParameters: queryParameters,
      );
  static Uri indexPlaces({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/index",
        queryParameters: queryParameters,
      );

  static Uri indexTopAttraction({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/indexTopAttraction",
        queryParameters: queryParameters,
      );
  static Uri indexNearByPlaces({
    Map<String, dynamic>? queryParameters,
    required String id,
  }) =>
      _mobileUri(
        path: "place/$id/indexNearByPlace",
        queryParameters: queryParameters,
      );
  static Uri indexRecentlyViewed({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/indexRecentlyViewed",
        queryParameters: queryParameters,
      );
  static Uri indexTrending({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/indexTrending",
        queryParameters: queryParameters,
      );
  static Uri indexMostFavorite({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/indexMostFavorite",
        queryParameters: queryParameters,
      );
  ///////////
  ///place///
  //////////
  static Uri getPlace(String id) => _mobileUri(
        path: "place/$id/show",
      );
  static Uri indexPlaceImages(String id, Map<String, dynamic> params) =>
      _mobileUri(path: "place/$id/image/index");
  static Uri uploadImagePlace(String id) =>
      _mobileUri(path: "place/$id/image/store");
  static Uri changeFavoriteState(String id) => _mobileUri(
        path: "favourite/$id/changeStatus",
      );
  static Uri indexPlaceToMap(Map<String, dynamic> params) => _mobileUri(
        path: "place/place_by_point_map",
        queryParameters: params,
      );

  static Uri getCity({required Map<String, dynamic> params}) {
    return _mainUri(path: "mobile/city/${params["id"]}/show");
  }

  static Uri getPlacesOfCity({required Map<String, dynamic> params}) {
    return _mainUri(path: "mobile/place/${params["id"]}/show");
  }

  static Uri questionsAdd(
          {Map<String, dynamic>? params, required int cityId}) =>
      _mobileUri(
        path: "question/city/$cityId/store",
        queryParameters: params,
      );
  static Uri questionsIndex(
          {Map<String, dynamic>? params, required int cityId}) =>
      _mobileUri(
        path: "question/city/$cityId/index",
        queryParameters: params,
      );
  static Uri questionsDelete({Map<String, dynamic>? params, required int id}) =>
      _mobileUri(
        path: "question/$id/delete",
        queryParameters: params,
      );
  static Uri answersDelete({Map<String, dynamic>? params, required int id}) =>
      _mobileUri(
        path: "answer/$id/delete",
        queryParameters: params,
      );
  static Uri answersAdd(
          {Map<String, dynamic>? params, required int questionId}) =>
      _mobileUri(
        path: "answer/question/$questionId/store",
        queryParameters: params,
      );
  static Uri indexFavoritePlace(Map<String, dynamic> params) => _mobileUri(
        path: "favourite/index",
        queryParameters: params,
      );
  static Uri addReviewToPlace(String id) =>
      _mobileUri(path: "comment/place/$id/store");
  static Uri getReviewsToPlace(String id, Map<String, dynamic> params) =>
      _mobileUri(
        path: "comment/place/$id/index",
        queryParameters: params,
      );

  static Uri getVisitTypes() => _mobileUri(path: "visitType/index");
  static Uri plansAllIndex({required Map<String, dynamic> queryParams}) =>
      _mobileUri(
        path: "plan/index",
        queryParameters: queryParams,
      );
  static Uri plansUserIndex({required Map<String, dynamic> queryParams}) =>
      _mobileUri(
        path: "plan/user/index",
        queryParameters: queryParams,
      );
  static Uri plansStore({Map<String, dynamic>? queryParams}) => _mobileUri(
        path: "plan/store",
        queryParameters: queryParams,
      );
  static Uri plansDelete(
          {required int id, Map<String, dynamic>? queryParams}) =>
      _mobileUri(
        path: "plan/$id/delete",
        queryParameters: queryParams,
      );

  static Uri planContentsIndex(
          {required int planId, required Map<String, dynamic> queryParams}) =>
      _mobileUri(
        path: "planContent/plan/$planId/index",
        queryParameters: queryParams,
      );
  static Uri planContentsStore(
          {required int planId, Map<String, dynamic>? queryParams}) =>
      _mobileUri(
        path: "planContent/plan/$planId/store",
        queryParameters: queryParams,
      );
  static Uri planContentDelete(
          {required int id, Map<String, dynamic>? queryParams}) =>
      _mobileUri(
        path: "planContent/$id/delete",
        queryParameters: queryParams,
      );

  static Uri hostSendRequest({Map<String, dynamic>? queryParams}) => _mobileUri(
        path: "user/requestHost",
        queryParameters: queryParams,
      );
  static Uri getFeatureTitle() => _mobileUri(path: "featureTitle/index");

  static Uri getPlacesBySearch(Map<String, dynamic> params) => _mobileUri(
        path: "place/indexwithSearch",
        queryParameters: params,
      );
  static Uri getExperiences(Map<String, dynamic> params) => _mobileUri(
        path: "experience/index",
        queryParameters: params,
      );
  static Uri getExperinceDetailes(String id) => _mobileUri(
        path: "experience/$id/show",
      );
  static Uri addExperince() => _mobileUri(
        path: "experience/store",
      );
}
