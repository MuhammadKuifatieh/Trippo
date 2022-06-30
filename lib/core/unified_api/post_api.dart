import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/global_functions.dart';
import 'handling_exception_request.dart';

typedef _FromJson<T> = T Function(String body);

class PostApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final _FromJson<T> fromJson;
  final bool isLogin;
  PostApi({
    required this.uri,
    required this.body,
    required this.fromJson,
    this.isLogin = false,
  });
  Future<T> callRequest() async {
    String? token = GlobalFunctions.getToken();

    String fcmToken = await GlobalFunctions().getFCMToken();
    bool isAuth = await GlobalFunctions().isAuth();
    String language = await GlobalFunctions().getLanguage();

    log('the token in the request header is $token',
        name: 'request manager ==> post function ');
    var headers = {
      'Content-Type': 'application/json',
      'fcmtoken': fcmToken,
      'Accept': 'application/json',
      "language": language,
      if (isAuth) 'Authorization': 'Bearer $token',
    };

    var request = http.Request('POST', uri);
    request.body = jsonEncode(body);
    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));
    http.Response response = await http.Response.fromStream(streamedResponse);
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      Exception exception = getException(response: response);
      throw exception;
    }
  }
}
