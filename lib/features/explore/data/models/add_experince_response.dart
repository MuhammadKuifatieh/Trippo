import 'dart:convert';

import 'experienes_response.dart';

AddExperienceResponse addExperienceResponseFromJson(String str) =>
    AddExperienceResponse.fromJson(json.decode(str));

String addExperienceResponseToJson(AddExperienceResponse data) =>
    json.encode(data.toJson());

class AddExperienceResponse {
  AddExperienceResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  AddExperienceResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AddExperienceResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AddExperienceResponse.fromJson(Map<String, dynamic> json) =>
      AddExperienceResponse(
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
    this.experience,
  });

  ExperienceModel? experience;

  Data copyWith({
    ExperienceModel? experience,
  }) =>
      Data(
        experience: experience ?? this.experience,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        experience: json["experience"] == null
            ? null
            : ExperienceModel.fromJson(json["experience"]),
      );

  Map<String, dynamic> toJson() => {
        "experience": experience == null ? null : experience!.toJson(),
      };
}
