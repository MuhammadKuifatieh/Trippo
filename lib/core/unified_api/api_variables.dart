import 'dart:developer';


class ApiVariables {
  ApiVariables._();

  static const _scheme = 'http';
  static const _host = '192.168.1.112';
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
  static Uri indexPlaces({
    Map<String, dynamic>? queryParameters,
  }) =>
      _mobileUri(
        path: "place/index",
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
  static Uri questionsAdd({Map<String, dynamic>? params, required int cityId}) => _mobileUri(
        path: "question/city/$cityId/store",
        queryParameters: params,
      );
  static Uri questionsIndex({Map<String, dynamic>? params, required int cityId}) => _mobileUri(
        path: "question/city/$cityId/index",
        queryParameters: params,
      );
  static Uri questionsDelete({Map<String, dynamic>? params, required int id}) => _mobileUri(
        path: "question/$id/delete",
        queryParameters: params,
      );
static Uri answersDelete({Map<String, dynamic>? params, required int id}) => _mobileUri(
        path: "answer/$id/delete",
        queryParameters: params,
      );
static Uri answersAdd({Map<String, dynamic>? params, required int questionId}) => _mobileUri(
        path: "answer/question/$questionId/store",
        queryParameters: params,
      );
  static Uri indexFavoritePlace(Map<String, dynamic> params) => _mobileUri(
        path: "favourite/index",
        queryParameters: params,
      );
  static Uri addReviewToPlace(String id) =>
      _mobileUri(path: "comment/place/$id/store");
  static Uri getReviews(Map<String, dynamic> params) => _mobileUri(
        path: "comment/index",
        queryParameters: params,
      );

  static Uri getVisitTypes() => _mobileUri(path: "visitType/index");
}
