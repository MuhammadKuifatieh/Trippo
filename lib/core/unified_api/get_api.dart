import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/global_functions.dart';
import 'handling_exception_request.dart';

typedef _FromJson<T> = T Function(String body);

class GetApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final _FromJson<T> fromJson;
  final bool getFCMToken;
  GetApi(
      {required this.uri,
      required this.fromJson,
      this.getFCMToken = false,
      this.body = const {}});
  Future<T> callRequest() async {
    String? token = GlobalFunctions.getToken();
    String fcmToken =
        await GlobalFunctions().getFCMToken(getFCMToken: getFCMToken);
    String language = await GlobalFunctions().getLanguage();
    // bool isAuth = await GlobalFunctions().isAuth();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'fcmtoken': fcmToken,
      "language": language,
      // if (isAuth) 
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('GET', uri);
    request.body = jsonEncode(body);
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
