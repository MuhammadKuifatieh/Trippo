import 'package:dartz/dartz.dart';
import 'package:trippo/features/place/data/models/add_reviwe_response.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/place_repository.dart';

class AddReviewToPlace implements UseCase<AddReviewResponse, AddReviewToPlaceParams> {
  final PlaceRepository placeRepository;

  AddReviewToPlace({required this.placeRepository});
  @override
  Future<Either<Failure, AddReviewResponse>> call(
      AddReviewToPlaceParams params) async {
    return placeRepository.addReviewToPlace(
      id: params.id,
      body: params.getBody(),
    );
  }
}

class AddReviewToPlaceParams {
  final String id;
  final String title;
  final String description;
  final String dateTime;
  final String visitTypeId;
  final List<String?> images;
  final double ratting;

  AddReviewToPlaceParams({
    required this.id,
    required this.title,
    required this.images,
    required this.ratting,
    required this.dateTime,
    required this.description,
    required this.visitTypeId,
  });
  Map<String, dynamic> getBody() => {
        "tilte": title,
        "description": description,
        "full_date": dateTime,
        "images": images,
        "visit_type_id": visitTypeId,
        "rating": ratting,
      };
}
