import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/no_response.dart';
import 'package:trippo/features/explore/data/datasources/remote_add_experince_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../home/data/models/places_response.dart';
import '../../domin/repositories/experince_repository.dart';
import '../datasources/remote_get_experiences_data_source.dart';
import '../datasources/remote_get_experince_detailes_data_source.dart';
import '../datasources/remote_get_places_to_exprince_data_source.dart';
import '../models/add_experince_response.dart';
import '../models/experienes_response.dart';
import '../models/experince_detailes_response.dart';

class ExperinceRepositoryImplement
    with HandlingExceptionManager
    implements ExperinceRepository {
  final _getPlacesToExperince = RemoteGetPlacesToExperinceDataSource();
  final _getExperinces = RemoteGetExperiencesDataSource();
  final _getExperinceDetails = RemoteGetExperinceDetailesDataSource();
  final _addExperince = RemoteAddExperinceDataSource();
  @override
  Future<Either<Failure, PlacesResponse>> getPlacesToExperince(
      String id) async {
    return wrapHandling(tryCall: () async {
      final result = await _getPlacesToExperince.getPlacesToExperince(id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, ExperiencesResponse>> getExperiences(
      Map<String, dynamic> params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getExperinces.getExperiences(params);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, ExperienceDetailesResponse>> getExperinceDetails(
      String id) async {
    return wrapHandling(tryCall: () async {
      final result = await _getExperinceDetails.getExperinceDetailes(id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> addExperince(
      Map<String, dynamic> body) async {
    return wrapHandling(tryCall: () async {
      final result = await _addExperince.addExperince(body);
      return Right(result);
    });
  }
}
