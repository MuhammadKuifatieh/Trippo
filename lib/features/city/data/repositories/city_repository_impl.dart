import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/city/data/datasources/get_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_places_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/models/place_of_city_response_model/place_of_city_model.dart';
import 'package:trippo/features/city/data/questions_data_source.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';
import 'package:trippo/features/city/domain/usecases/get_questions_use_case.dart';
import 'package:trippo/features/city/domain/usecases/add_question_use_case.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../models/question/question_model.dart';

class CityRepositoryImpl
    with HandlingExceptionManager
    implements CityRepository {
  final GetCityRemoteDataSource _getCityRemoteDataSource =
      GetCityRemoteDataSource();
  final GetPlacesOfCityRemoteDataSource _getPlacesOfCityRemoteDataSource =
      GetPlacesOfCityRemoteDataSource();
  final QuestionsDataSource _questionsDataSource = QuestionsDataSource();

  @override
  Future<Either<Failure, CityModel>> getCityById(
      {required Map<String, dynamic> params}) async {
    return await wrapHandling(tryCall: () async {
      final city = await _getCityRemoteDataSource.getCity(params: params);
      return Right(city);
    });
  }

  @override
  Future<Either<Failure, List<PlaceOfCityModel>>> getPlacesOfCity(
      {required Map<String, dynamic> params}) async {
    return await wrapHandling(tryCall: () async {
      final places = await _getPlacesOfCityRemoteDataSource.getPlacesOfCity(
          params: params);
      return Right(places);
    });
  }

  @override
  Future<Either<Failure, QuestionModel>> addQuestion(
      {required AddQuestionParams params}) async {
    return await wrapHandling<QuestionModel>(
      tryCall: () async {
        final model = await _questionsDataSource.addQuestion(
            cityId: params.cityId, body: params.toMap());
        return Right(model);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> deleteQuestion(int id) async {
    return await wrapHandling<bool>(
      tryCall: () async {
        final res = await _questionsDataSource.deleteQuestion(id: id);
        return Right(res);
      },
    );
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required GetQuestionsParams params}) async {
    return await wrapHandling<List<QuestionModel>>(
      tryCall: () async {
        final models = await _questionsDataSource.getQuestions(
            cityId: params.cityId, params: params.toMap());
        return Right(models);
      },
    );
  }
}
