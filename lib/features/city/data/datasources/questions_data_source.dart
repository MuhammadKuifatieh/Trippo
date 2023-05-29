import 'dart:convert';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/delete_api.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/core/unified_api/post_api.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../models/question/question_model.dart';

class QuestionsDataSource {
  Future<QuestionModel> addQuestion(
      {required int cityId, required Map<String, dynamic> body}) async {
    final PostApi<QuestionModel> postApi = PostApi(
        uri: ApiVariables.questionsAdd(cityId: cityId),
        body: body,
        fromJson: (jsonStr) {
          final jsonMap = jsonDecode(jsonStr);
          return QuestionModel.fromJson(jsonMap['data']['question']);
        });

    return await postApi.callRequest();
  }

  Future<List<QuestionModel>> getQuestions(
      {required int cityId, required Map<String, dynamic> params}) async {
    final GetApi<List<QuestionModel>> getApi = GetApi(
        uri: ApiVariables.questionsIndex(cityId: cityId),
        fromJson: (jsonStr) {
          final jsonMap = jsonDecode(jsonStr);
          final jsonModelsList = jsonMap['data']['questions'] as List<dynamic>;
          return jsonModelsList.map<QuestionModel>((json) {
            return QuestionModel.fromJson(json);
          }).toList();
        });
    return await getApi.callRequest();
  }

  Future<bool> deleteQuestion({required int id}) async {
    final DeleteApi<bool> deleteApi = DeleteApi(
      uri: ApiVariables.questionsDelete(id: id),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        return jsonMap['success'];
      },
    );
    return deleteApi.callRequest();
  }

  Future<AnswerModel> addAnswer(
      {required int questionId, required Map<String, dynamic> body}) async {
    final PostApi<AnswerModel> postApi = PostApi(
        uri: ApiVariables.answersAdd(questionId: questionId),
        body: body,
        fromJson: (jsonStr) {
          final jsonMap = jsonDecode(jsonStr);
          return AnswerModel.fromJson(jsonMap['data']['answer']);
        });

    return await postApi.callRequest();
  }

  Future<bool> deleteAnswer({required int id}) async {
    final DeleteApi<bool> deleteApi = DeleteApi(
      uri: ApiVariables.answersDelete(id: id),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        return jsonMap['success'];
      },
    );
    return deleteApi.callRequest();
  }
}
