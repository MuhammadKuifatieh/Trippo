import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/city/domain/usecases/add_question_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_questions_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../../data/models/question/question_model.dart';

abstract class CityRepository {
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params});
  Future<Either<Failure, List<PlaceOfCityModel>>> getPlacesOfCity(
      {required Map<String, dynamic> params});
  Future<Either<Failure, QuestionModel>> addQuestion(
      {required AddQuestionParams params});
  Future<Either<Failure, bool>> deleteQuestion(int id);
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required GetQuestionsParams params});
}
