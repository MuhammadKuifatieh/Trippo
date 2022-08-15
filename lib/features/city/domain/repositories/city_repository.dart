import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/city/domain/usecases/add_question_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_places_of_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_questions_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
import 'package:trippo/features/home/data/models/places_response.dart';

import '../../data/models/question/question_model.dart';
import '../usecases/add_answer_use_case.dart';

abstract class CityRepository {
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<PlaceModel>>> getPlacesOfCity(
      {required GetPlacesOfCityParams params});
  Future<Either<Failure, QuestionModel>> addQuestion(
      {required AddQuestionParams params});
      Future<Either<Failure, AnswerModel>> addAnswer(
      {required AddAnswerParams params});
  Future<Either<Failure, bool>> deleteQuestion(int id);
  Future<Either<Failure, bool>> deleteAnswer(int id);
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required GetQuestionsParams params});
}
