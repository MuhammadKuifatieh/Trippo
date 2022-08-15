import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../../data/models/question/question_model.dart';
import '../repositories/city_repository.dart';

class AddQuestionUseCase extends UseCase<QuestionModel, AddQuestionParams> {
  final CityRepository cityRepository;

  AddQuestionUseCase({required this.cityRepository});
  @override
  Future<Either<Failure, QuestionModel>> call(AddQuestionParams params) async {
    return await cityRepository.addQuestion(params:params);
  }
}

class AddQuestionParams {
  final int cityId;
  final String text;

  AddQuestionParams({
    required this.cityId,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'text':text,
    };
  }
}
