import 'dart:convert';

import 'experienes_response.dart';

ExperienceDetailesResponse experienceDetailesResponseFromJson(String str) =>
    ExperienceDetailesResponse.fromJson(json.decode(str));

String experienceDetailesResponseToJson(ExperienceDetailesResponse data) =>
    json.encode(data.toJson());

class ExperienceDetailesResponse {
  ExperienceDetailesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  ExperienceDetailesDataModel? data;

  ExperienceDetailesResponse copyWith({
    bool? success,
    String? message,
    ExperienceDetailesDataModel? data,
  }) =>
      ExperienceDetailesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ExperienceDetailesResponse.fromJson(Map<String, dynamic> json) =>
      ExperienceDetailesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ExperienceDetailesDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class ExperienceDetailesDataModel {
  ExperienceDetailesDataModel({
    this.experience,
  });

  ExperienceModel? experience;

  ExperienceDetailesDataModel copyWith({
    ExperienceModel? experience,
  }) =>
      ExperienceDetailesDataModel(
        experience: experience ?? this.experience,
      );

  factory ExperienceDetailesDataModel.fromJson(Map<String, dynamic> json) =>
      ExperienceDetailesDataModel(
        experience: json["experience"] == null
            ? null
            : ExperienceModel.fromJson(json["experience"]),
      );

  Map<String, dynamic> toJson() => {
        "experience": experience == null ? null : experience!.toJson(),
      };
}
