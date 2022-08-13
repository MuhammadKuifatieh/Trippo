import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/config/croper/ui_helper.dart'
    if (dart.library.io) '../../../../core/config/croper/mobile_ui_helper.dart'
    if (dart.library.html) '../../../../core/config/croper/web_ui_helper.dart';

Future<Uint8List?> getAndCropImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final value = await _picker.pickImage(source: ImageSource.gallery);
  if (value != null) {
    final path = value.path;
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      uiSettings: buildUiSettings(context),
    );
    if (croppedFile != null) {
      return croppedFile.readAsBytes();
    }
  }

  return null;
}
