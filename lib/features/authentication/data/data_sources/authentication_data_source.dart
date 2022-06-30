import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/post_api.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';

class AuthenticationDataSource {
  Future<RegistrationResponse> register(
      {required Map<String, dynamic> body}) async {
    final PostApi<RegistrationResponse> postApi = PostApi(
      uri: ApiVariables.registerUri(),
      body: body,
      fromJson: (rawJson) {
        final json = jsonDecode(rawJson);
        return RegistrationResponse.fromJson(json['data']);
      },
    );

    return await postApi.callRequest();
  }

  Future<RegistrationResponse> login(
      {required Map<String, dynamic> body}) async {
    final PostApi<RegistrationResponse> postApi = PostApi(
      uri: ApiVariables.loginUri(),
      body: body,
      fromJson: (rawJson) {
        final json = jsonDecode(rawJson);
        return RegistrationResponse.fromJson(json['data']);
      },
    );

    return await postApi.callRequest();
  }
}
