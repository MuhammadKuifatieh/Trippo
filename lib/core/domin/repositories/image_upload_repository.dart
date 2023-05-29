import 'package:dartz/dartz.dart';

import '../../data/models/image_model.dart';
import '../../error/failures.dart';

abstract class ImageUploadRepository {
  Future<Either<Failure, ImageUploadModelResponse >> call(Map<String, dynamic> body);
}
