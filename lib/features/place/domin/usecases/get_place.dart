import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/place_response.dart';
import '../repositories/place_repository.dart';

class GetPlace implements UseCase<PlaceResponse, GetPlaceParams> {
  final PlaceRepository placeRepository;

  GetPlace({required this.placeRepository});
  @override
  Future<Either<Failure, PlaceResponse>> call(GetPlaceParams params) async {
    return placeRepository.getPlace(params.id);
  }
}

class GetPlaceParams {
  final String id;
  GetPlaceParams({required this.id});
}
