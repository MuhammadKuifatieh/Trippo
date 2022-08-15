import 'package:dartz/dartz.dart';
import 'package:trippo/features/place/data/datasources/remote_change_favorite_state_data_source.dart';
import 'package:trippo/features/profile/data/datasources/remote_get_favorite_places_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../home/data/models/places_response.dart';
import '../../domin/repositories/profile_repository.dart';

class ProfileRepositoryImplement
    with HandlingExceptionManager
    implements ProfileRepository {
  final _getFavoritePlaces = RemoteGetFavoritePlacesDataSource();
  @override
  Future<Either<Failure, PlacesResponse>> getFavoritePlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getFavoritePlaces.getFavoritePlaces(params);
      return Right(result);
    });
  }
}
