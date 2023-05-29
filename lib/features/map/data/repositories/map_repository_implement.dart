import 'package:dartz/dartz.dart';
import 'package:trippo/features/home/data/models/places_response.dart';
import 'package:trippo/features/map/data/datasources/remote_get_places_to_map_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domin/repositories/map_repository.dart';
import '../datasources/remote_get_types_data_source.dart';
import '../models/type_respnse.dart';

class MapRepositoryImplement
    with HandlingExceptionManager
    implements MapRepository {
  final _getTypes = RemoteGetTypesDataSource();
  final _getPlacesToMap = RemoteGetPlacesToMapDataSource();
  @override
  Future<Either<Failure, TypesResponse>> getTypes() async {
    return wrapHandling(tryCall: () async {
      final result = await _getTypes.getTypes();
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getPlacesToMap(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getPlacesToMap.getPlacesToMap(params);
      return Right(result);
    });
  }
}
