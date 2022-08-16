import 'dart:convert';
import 'dart:developer';

import 'package:trippo/core/unified_api/api_variables.dart';
import 'package:trippo/core/unified_api/delete_api.dart';
import 'package:trippo/core/unified_api/get_api.dart';
import 'package:trippo/core/unified_api/post_api.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/data/models/plan_content/plan_content_model.dart';

class PlansDataSource {
  Future<List<PlanModel>> getAllPlans(
      {required int cityId, required Map<String, dynamic> queryParams}) async {
    final GetApi<List<PlanModel>> getApi = GetApi(
      uri: ApiVariables.plansAllIndex(cityId: cityId, queryParams: queryParams),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        final jsonList = jsonMap['data']['plans'] as List<dynamic>;
        return jsonList.map<PlanModel>((json) {
          return PlanModel.fromJson(json);
        }).toList();
      },
    );

    return await getApi.callRequest();
  }

  Future<List<PlanModel>> getUserPlans(
      {required Map<String, dynamic> queryParams}) async {
    final GetApi<List<PlanModel>> getApi = GetApi(
      uri: ApiVariables.plansUserIndex(queryParams: queryParams),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        final jsonList = jsonMap['data']['plans'] as List<dynamic>;
        return jsonList.map<PlanModel>((json) {
          return PlanModel.fromJson(json);
        }).toList();
      },
    );

    return await getApi.callRequest();
  }

  Future<PlanModel> addPlan({required Map<String, dynamic> body}) async {
    final PostApi<PlanModel> postApi = PostApi(
      uri: ApiVariables.plansStore(),
      body: body,
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        return PlanModel.fromJson(jsonMap['data']['plan']);
      },
    );

    return await postApi.callRequest();
  }

  Future<bool> deletePlan(int id) async {
    final DeleteApi<bool> deleteApi = DeleteApi(
      uri: ApiVariables.plansDelete(id: id),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        return jsonMap['success'];
      },
    );

    return await deleteApi.callRequest();
  }

  Future<List<PlanContentModel>> getPlanContents(
      {required Map<String, dynamic> queryParams, required int planId}) async {
    final GetApi<List<PlanContentModel>> getApi = GetApi(
      uri: ApiVariables.planContentsIndex(
          queryParams: queryParams, planId: planId),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        final jsonList = jsonMap['data']['planContents'] as List<dynamic>;
        return jsonList.map<PlanContentModel>((json) {
          return PlanContentModel.fromJson(json);
        }).toList();
      },
    );

    return await getApi.callRequest();
  }

  Future<PlanContentModel> addPlanContent(
      {required Map<String, dynamic> body, required int planId}) async {
    final PostApi<PlanContentModel> postApi = PostApi(
      uri: ApiVariables.planContentsStore(planId: planId),
      body: body,
      fromJson: (jsonStr) {
        log('JSON STR IN PLANS IS $jsonStr');
        final jsonMap = jsonDecode(jsonStr);
        return PlanContentModel.fromJson(jsonMap['data']['planContent']);
      },
    );

    return await postApi.callRequest();
  }

  Future<bool> deletePlanContent(int id) async {
    final DeleteApi<bool> deleteApi = DeleteApi(
      uri: ApiVariables.planContentDelete(id: id),
      fromJson: (jsonStr) {
        final jsonMap = jsonDecode(jsonStr);
        return jsonMap['success'];
      },
    );

    return await deleteApi.callRequest();
  }
}
