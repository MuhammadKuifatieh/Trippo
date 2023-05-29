import 'package:dartz/dartz.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/place_repository.dart';

class ChangeFavoriteState
    implements UseCase<NoResponse, ChangeFavoriteStateParams> {
  final PlaceRepository placeRepository;

  ChangeFavoriteState({required this.placeRepository});
  @override
  Future<Either<Failure, NoResponse>> call(ChangeFavoriteStateParams params) {
    return placeRepository.changeFavoriteState(params.id);
  }
}

class ChangeFavoriteStateParams {
  final String id;

  ChangeFavoriteStateParams({required this.id});
}
