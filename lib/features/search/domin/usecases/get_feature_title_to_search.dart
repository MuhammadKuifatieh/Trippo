import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/no_response.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/search/data/models/feature_title_response.dart';
import 'package:trippo/features/search/domin/repositories/search_repository.dart';

class GetFeatureTitle implements UseCase<FeatureTitleResponse, NoParams> {
  final SearchRepository searchRepository;

  GetFeatureTitle({required this.searchRepository});
  @override
  Future<Either<Failure, FeatureTitleResponse>> call(NoParams params) async {
    return searchRepository.getFeatureTitle();
  }
}
