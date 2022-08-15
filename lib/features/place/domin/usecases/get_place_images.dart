import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/images_reponse.dart';
import '../repositories/place_repository.dart';

class GetPlaceImages implements UseCase<ImagesResponse, GetPlaceImagesParams> {
  final PlaceRepository placeRepository;

  GetPlaceImages({required this.placeRepository});

  @override
  Future<Either<Failure, ImagesResponse>> call(
      GetPlaceImagesParams params) async {
    return placeRepository.getPlaceImages(
      id: params.id,
      params: params.getParams(),
    );
  }
}

class GetPlaceImagesParams {
  final String id;
  final int page;
  final int perPage;

  GetPlaceImagesParams({
    required this.id,
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
