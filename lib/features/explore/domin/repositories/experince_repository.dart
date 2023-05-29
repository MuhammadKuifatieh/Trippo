import 'package:dartz/dartz.dart';
import 'package:trippo/features/explore/data/models/add_experince_response.dart';
import 'package:trippo/features/explore/data/models/experienes_response.dart';
import 'package:trippo/features/explore/data/models/experince_detailes_response.dart';

import '../../../../core/data/models/no_response.dart';
import '../../../../core/error/failures.dart';
import '../../../home/data/models/places_response.dart';

abstract class ExperinceRepository {
  Future<Either<Failure, PlacesResponse>> getPlacesToExperince(String id);
  Future<Either<Failure, ExperiencesResponse>> getExperiences(
      Map<String, dynamic> params);

  Future<Either<Failure, ExperienceDetailesResponse>> getExperinceDetails(
      String id);

  Future<Either<Failure, NoResponse >> addExperince(
      Map<String, dynamic> body);
}
