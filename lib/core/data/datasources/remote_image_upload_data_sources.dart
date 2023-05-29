import 'dart:developer';

import '../../unified_api/api_variables.dart';
import '../../unified_api/post_api.dart';
import '../models/image_model.dart';

class RemoteImagheUploadDataSources {
  Future<ImageUploadModelResponse> imageUpload(
      Map<String, dynamic> body) async {
    log(body.toString());
    PostApi multiPostApi = PostApi(
      body: body,
      fromJson: imageUploadModelResponseFromJson,
      uri: ApiVariables.uploadImageBase64(),
    );
    final result = await multiPostApi.callRequest();
    return result;
  }
}
