import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';

import '../../data/models/question/question_model.dart';
import '../repositories/city_repository.dart';

class AddAnswerUseCase extends UseCase<AnswerModel, AddAnswerParams> {
  final CityRepository cityRepository;

  AddAnswerUseCase({required this.cityRepository});
  @override
  Future<Either<Failure, AnswerModel>> call(AddAnswerParams params) async {
    return await cityRepository.addAnswer(params:params);
  }
}

class AddAnswerParams {
  final int questionId;
  final String text;

  AddAnswerParams({
    required this.questionId,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'text':text,
    };
  }
}
