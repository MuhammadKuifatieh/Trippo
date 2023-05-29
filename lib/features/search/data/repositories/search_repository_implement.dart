import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../home/data/datasources/all_cities_data_source.dart';
import '../../../home/data/models/cities_response.dart';
import '../../../home/data/models/places_response.dart';
import '../../../map/data/datasources/remote_get_types_data_source.dart';
import '../../../map/data/models/type_respnse.dart';
import '../../../place/data/datasources/remote_get_visit_types_data_source.dart';
import '../../../place/data/models/visit_types_response.dart';
import '../../domin/repositories/search_repository.dart';
import '../datasources/remote_get_feature_title_data_source.dart';
import '../datasources/remote_get_places_to_search.dart';
import '../models/feature_title_response.dart';

class SearchRepositoryImplement
    with HandlingExceptionManager
    implements SearchRepository {
  final _getTypes = RemoteGetTypesDataSource();
  final _getFeatureTitle = RemoteGetFeatureTitleDataSource();
  final _getVisitTypes = RemoteGetVisitTypesDataSource();
  final _getCities = AllCitiesDataSource();
  final _getPlaces = RemoteGetPlacesToSearchDataSource();
  @override
  Future<Either<Failure, TypesResponse>> getTypes() async {
    return wrapHandling(tryCall: () async {
      final result = await _getTypes.getTypes();
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, FeatureTitleResponse>> getFeatureTitle() async {
    return wrapHandling(tryCall: () async {
      final result = await _getFeatureTitle.getFeatureTitle();
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, VisitTypesResponse>> getVisitTypes() async {
    return wrapHandling(tryCall: () async {
      final result = await _getVisitTypes.getVisitTypes();
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, List<CityModel>>> getCities() async {
    return wrapHandling(tryCall: () async {
      final result = await _getCities.getAllCities({});
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, PlacesResponse>> getPlaces(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getPlaces.getPlaces(params);
      return Right(result);
    });
  }
}
