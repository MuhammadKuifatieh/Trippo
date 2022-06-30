import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/global_functions.dart';
import 'handling_exception_request.dart';

typedef _FromJson<T> = T Function(String body);

class DeleteApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final _FromJson fromJson;
  DeleteApi({
    required this.uri,
    required this.fromJson,
  });
  Future<T> callRequest() async {
    String? token = GlobalFunctions.getToken();
    String fcmToken = await GlobalFunctions().getFCMToken();
    bool isAuth = await GlobalFunctions().isAuth();
    String language = await GlobalFunctions().getLanguage();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'fcmtoken': fcmToken,
      "language": language,
      if (isAuth) 'Authorization': 'Bearer $token',
    };
    var request = http.Request('DELETE', uri);
    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));
    http.Response response = await http.Response.fromStream(streamedResponse);
    log(response.body);
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      Exception exception = getException(response: response);
      throw exception;
    }
  }
}
