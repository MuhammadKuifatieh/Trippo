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
  static Uri uploadImagePlace(String id) =>
      _mobileUri(path: "place/$id/image/store");
  static Uri changeFavoriteState(String id) => _mobileUri(
        path: "favourite/$id/changeStatus",
      );
  static Uri indexPlaceToMap(Map<String, dynamic> params) => _mobileUri(
        path: "place/place_by_point_map",
        queryParameters: params,
      );
  ///////////
  ///City///
//////////

  static Uri getCity({required Map<String, dynamic> params}) {
    return _mainUri(path: "mobile/city/${params["id"]}/show");
  }

 static Uri getPlacesOfCity({required Map<String, dynamic> params}) {
    return _mainUri(path: "mobile/place/${params["id"]}/show");
  }
}
