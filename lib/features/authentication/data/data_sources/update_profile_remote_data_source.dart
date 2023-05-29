import 'dart:convert';

import 'package:trippo/core/data/models/user/user.dart';
import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/post_api.dart';

class UpdateProfileRemoteDataSource {
  Future<User> updateProfileDataSource(
      {required Map<String, dynamic> body,String? id}) async {
    final PostApi<User> postApi = PostApi(
      uri: ApiVariables.updateProfile(id:id),
      body: body,
      fromJson: (rawJson) {
        final json = jsonDecode(rawJson);
        return User.fromJson(json['data']);
      },
    );

    return await postApi.callRequest();
  }
  }