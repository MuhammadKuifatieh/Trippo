import 'dart:convert';

import '../../../city/data/models/question/question_model.dart';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  CitiesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  CitiesDataModel? data;

  CitiesResponse copyWith({
    bool? success,
    String? message,
    CitiesDataModel? data,
  }) =>
      CitiesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CitiesDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class CitiesDataModel {
  CitiesDataModel({
    this.cities,
  });

  List<CityModel>? cities;

  CitiesDataModel copyWith({
    List<CityModel>? cities,
  }) =>
      CitiesDataModel(
        cities: cities ?? this.cities,
      );

  factory CitiesDataModel.fromJson(Map<String, dynamic> json) =>
      CitiesDataModel(
        cities: json["cities"] == null
            ? null
            : List<CityModel>.from(
                json["cities"].map((x) => CityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": cities == null
            ? null
            : List<dynamic>.from(cities!.map((x) => x.toJson())),
      };
}

class CityModel {
  const CityModel({
    this.id,
    this.name,
    this.description,
    this.views,
    this.latitude,
    this.longitude,
    this.images,
    this.questions,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? views;
  final double? latitude;
  final double? longitude;
  final List<ImageModel>? images;
  final List<QuestionModel>? questions;

  CityModel copyWith({
    int? id,
    String? name,
    String? description,
    int? views,
    double? latitude,
    double? longitude,
    List<ImageModel>? images,
    List<QuestionModel>? questions,
  }) =>
      CityModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        views: views ?? this.views,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        images: images ?? this.images,
        questions: questions ?? this.questions,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        views: json["views"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        images: json["images"] == null
            ? null
            : List<ImageModel>.from(
                json["images"].map((x) => ImageModel.fromJson(x))),
        questions: json["questions"] == null
            ? null
            : List<QuestionModel>.from(
                json["questions"].map((x) => QuestionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "views": views,
        "latitude": latitude,
        "longitude": longitude,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.url,
    this.order,
    this.hash,
  });

  int? id;
  String? url;
  int? order;
  String? hash;

  ImageModel copyWith({
    int? id,
    String? url,
    int? order,
    String? hash,
  }) =>
      ImageModel(
        id: id ?? this.id,
        url: url ?? this.url,
        order: order ?? this.order,
        hash: hash ?? this.hash,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        url: json["url"],
        order: json["order"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "order": order,
        "hash": hash,
      };
}
