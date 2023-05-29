import 'package:dartz/dartz.dart';

import '../../domin/repositories/image_upload_repository.dart';
import '../../error/failures.dart';
import '../../unified_api/handling_exception_manager.dart';
import '../datasources/remote_image_upload_data_sources.dart';
import '../models/image_model.dart';

class ImageUploadRepositoriesImplemet
    with HandlingExceptionManager
    implements ImageUploadRepository {
  final _uploadImage = RemoteImagheUploadDataSources();
  @override
  Future<Either<Failure, ImageUploadModelResponse >> call(
      Map<String, dynamic> body) async {
    return wrapHandling(tryCall: () async {
      final result = await _uploadImage.imageUpload(body);
      return Right(result);
    });
  }
}
