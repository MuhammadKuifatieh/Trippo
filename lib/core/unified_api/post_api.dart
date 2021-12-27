import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'handling_exception.dart';

typedef _FromJson<T> = T Function(String body);

class PostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final _FromJson fromJson;
  final bool isLogin;
  PostApi({
    required this.uri,
    required this.body,
    required this.fromJson,
    this.isLogin = false,
  });
  Future<dynamic> callRequest() async {
    String token = '';
    if (!isLogin) {
      token = '';
    }
    log('the token in the request header is $token',
        name: 'request manager ==> post function ');
    try {
      var headers = {
        'Content-Type': 'application/json',
        if (!isLogin) 'Authorization': 'Bearer $token',
      };

      var request = http.Request('POST', uri);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 20));
      http.Response response = await http.Response.fromStream(streamedResponse);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(statusCode: response.statusCode);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception',
        name: 'RequestManager post function',
      );
    } on FormatException {
      log(
        'something wrong in parsing the uri',
        name: 'RequestManager post function',
      );
    } on SocketException {
      log(
        'socket exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager post function',
      );
      rethrow;
    }
  }
}
