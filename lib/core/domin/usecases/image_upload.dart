import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/image_model.dart';

import '../../data/models/no_response.dart';
import '../../error/failures.dart';
import '../../use_case/use_case.dart';
import '../repositories/image_upload_repository.dart';

class ImageUpload implements UseCase<ImageUploadModelResponse , ImageUploadParams> {
  final ImageUploadRepository imageUploadRepository;
  ImageUpload({required this.imageUploadRepository});
  @override
  Future<Either<Failure, ImageUploadModelResponse >> call(ImageUploadParams params) {
    return imageUploadRepository(params.getParams());
  }
}

class ImageUploadParams {
  final Uint8List image;
  ImageUploadParams({required this.image});
  Map<String, dynamic> getParams() {
    return {
      'image64': "data:image/png;base64," + base64.encode(image),
    };
  }
}
