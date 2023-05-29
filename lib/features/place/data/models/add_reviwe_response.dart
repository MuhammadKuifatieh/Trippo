// To parse this JSON data, do
//
//     final addReviewResponse = addReviewResponseFromJson(jsonString);

import 'dart:convert';

import 'package:trippo/features/place/data/models/reviews_response.dart';

AddReviewResponse addReviewResponseFromJson(String str) =>
    AddReviewResponse.fromJson(json.decode(str));

String addReviewResponseToJson(AddReviewResponse data) =>
    json.encode(data.toJson());

class AddReviewResponse {
  AddReviewResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  AddReviewResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AddReviewResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AddReviewResponse.fromJson(Map<String, dynamic> json) =>
      AddReviewResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.review,
  });

  ReviewModel? review;

  Data copyWith({
    ReviewModel? review,
  }) =>
      Data(
        review: review ?? this.review,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        review: json["comment"] == null
            ? null
            : ReviewModel.fromJson(json["comment"]),
      );

  Map<String, dynamic> toJson() => {
        "comment": review == null ? null : review!.toJson(),
      };
}
