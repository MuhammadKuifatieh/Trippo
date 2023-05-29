import 'package:dartz/dartz.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/place_repository.dart';

class UploadImagePlace implements UseCase<NoResponse, UploadImagePlaceParams> {
  final PlaceRepository placeRepository;

  UploadImagePlace({required this.placeRepository});

  @override
  Future<Either<Failure, NoResponse>> call(
      UploadImagePlaceParams params) async {
    return placeRepository.uploadImagePlace(
      id: params.id,
      body: params.getBody(),
    );
  }
}

class UploadImagePlaceParams {
  final String id;
  final String imageName;

  UploadImagePlaceParams({
    required this.id,
    required this.imageName,
  });
  Map<String, dynamic> getBody() => {
        "image": imageName,
      };
}
