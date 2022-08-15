import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../../data/models/question/question_model.dart';
import '../repositories/city_repository.dart';

class GetQuestionsUseCase
    extends UseCase<List<QuestionModel>, GetQuestionsParams> {
  final CityRepository cityRepository;

  GetQuestionsUseCase({required this.cityRepository});
  @override
  Future<Either<Failure, List<QuestionModel>>> call(
      GetQuestionsParams params) async {
    return await cityRepository.getQuestions(params:params);
  }
}

class GetQuestionsParams {
  final int cityId;
  final int page;
  final int perPage;

  GetQuestionsParams({
    required this.cityId,
    this.page = 1,
    this.perPage = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page.toString(),
      'perPage': perPage.toString(),
    };
  }
}
