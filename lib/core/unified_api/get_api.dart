import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'handling_exception.dart';

typedef _FromJson<T> = T Function(String body);

class GetApi with HandlingExceptionRequest {
  final Uri uri;
  final _FromJson fromJson;
  GetApi({
    required this.uri,
    required this.fromJson,
  });
  Future<dynamic> callRequest() async {
    String token = '';
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 20));
      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(statusCode: response.statusCode);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception',
        name: 'RequestManager get function',
      );
    } on FormatException {
      log(
        'something wrong in parsing the uri',
        name: 'RequestManager get function',
      );
    } on SocketException {
      log(
        'socket exception',
        name: 'RequestManager get function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager get function',
      );
      rethrow;
    }
  }
}
