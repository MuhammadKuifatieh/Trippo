import 'dart:convert';

import '../../../home/data/models/cities_response.dart';

FeatureTitleResponse featureTitleResponseFromJson(String str) =>
    FeatureTitleResponse.fromJson(json.decode(str));

String featureTitleResponseToJson(FeatureTitleResponse data) =>
    json.encode(data.toJson());

class FeatureTitleResponse {
  FeatureTitleResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  FeatureTitleDataModel? data;

  FeatureTitleResponse copyWith({
    bool? success,
    String? message,
    FeatureTitleDataModel? data,
  }) =>
      FeatureTitleResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory FeatureTitleResponse.fromJson(Map<String, dynamic> json) =>
      FeatureTitleResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : FeatureTitleDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class FeatureTitleDataModel {
  FeatureTitleDataModel({
    this.featureTitles,
  });

  List<FeatureTitleModel>? featureTitles;

  FeatureTitleDataModel copyWith({
    List<FeatureTitleModel>? featureTitles,
  }) =>
      FeatureTitleDataModel(
        featureTitles: featureTitles ?? this.featureTitles,
      );

  factory FeatureTitleDataModel.fromJson(Map<String, dynamic> json) => FeatureTitleDataModel(
        featureTitles: json["featureTitles"] == null
            ? null
            : List<FeatureTitleModel>.from(
                json["featureTitles"].map((x) => FeatureTitleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featureTitles": featureTitles == null
            ? null
            : List<dynamic>.from(featureTitles!.map((x) => x.toJson())),
      };
}

class FeatureTitleModel {
  FeatureTitleModel({
    this.id,
    this.title,
    this.image,
    this.features,
  });

  int? id;
  String? title;
  ImageModel? image;
  List<FeatureModel>? features;

  FeatureTitleModel copyWith({
    int? id,
    String? title,
    ImageModel? image,
    List<FeatureModel>? features,
  }) =>
      FeatureTitleModel(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        features: features ?? this.features,
      );

  factory FeatureTitleModel.fromJson(Map<String, dynamic> json) => FeatureTitleModel(
        id: json["id"],
        title: json["title"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        features: json["features"] == null
            ? null
            : List<FeatureModel>.from(
                json["features"].map((x) => FeatureModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image == null ? null : image!.toJson(),
        "features": features == null
            ? null
            : List<dynamic>.from(features!.map((x) => x.toJson())),
      };
}

class FeatureModel {
  FeatureModel({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  FeatureModel copyWith({
    int? id,
    String? title,
  }) =>
      FeatureModel(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
