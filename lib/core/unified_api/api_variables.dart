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

  static Uri registerUri({Map<String, dynamic>? queryParameters}) {
    return _mainUri(
        path: 'auth/user/register', queryParameters: queryParameters);
  }

  static Uri loginUri({Map<String, dynamic>? queryParameters}) {
    return _mainUri(
        path: 'auth/user/login', queryParameters: queryParameters);
  }
}
