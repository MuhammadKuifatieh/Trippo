import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/places_response.dart';
import '../repositories/home_repository.dart';

class GetSmallBatchPlaces
    implements UseCase<PlacesResponse, GetSmallBatchParams> {
  final HomeRepository homeRepository;

  GetSmallBatchPlaces({required this.homeRepository});
  @override
  Future<Either<Failure, PlacesResponse>> call(GetSmallBatchParams params) {
    return homeRepository.getSmallBatchPlaces(params.getParams());
  }
}

class GetSmallBatchParams {
  final int page;
  final int perPage;

  GetSmallBatchParams({
    required this.page,
    required this.perPage,
  });
  Map<String, dynamic> getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
