import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/global_functions.dart';
import 'handling_exception_request.dart';

typedef _FromJson<T> = T Function(String body);

class MultiPostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map<String, String> body;
  final _FromJson fromJson;
  MultiPostApi({
    required this.uri,
    required this.body,
    required this.fromJson,
  });
  Future<dynamic> callRequest() async {
    String language = await GlobalFunctions().getLanguage();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "language": language,
    };
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    for (var item in body.entries) {
      request.files
          .add(await http.MultipartFile.fromPath(item.key, item.value));
    }

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
