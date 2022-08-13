import 'dart:convert';

import '../../../home/data/models/cities_response.dart';

TypesResponse typesResponseFromJson(String str) =>
    TypesResponse.fromJson(json.decode(str));

String typesResponseToJson(TypesResponse data) => json.encode(data.toJson());

class TypesResponse {
  TypesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  TypesDataModel? data;

  TypesResponse copyWith({
    bool? success,
    String? message,
    TypesDataModel? data,
  }) =>
      TypesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory TypesResponse.fromJson(Map<String, dynamic> json) => TypesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : TypesDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class TypesDataModel {
  TypesDataModel({
    this.types,
  });

  List<TypeModel>? types;

  TypesDataModel copyWith({
    List<TypeModel>? types,
  }) =>
      TypesDataModel(
        types: types ?? this.types,
      );

  factory TypesDataModel.fromJson(Map<String, dynamic> json) => TypesDataModel(
        types: json["types"] == null
            ? null
            : List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "types": types == null
            ? null
            : List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class TypeModel {
  TypeModel({
    this.id,
    this.name,
    this.image,
    this.options,
  });

  int? id;
  String? name;
  ImageModel? image;
  List<OptionModel>? options;

  TypeModel copyWith({
    int? id,
    String? name,
    ImageModel? image,
    List<OptionModel>? options,
  }) =>
      TypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        options: options ?? this.options,
      );

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        options: json["options"] == null
            ? null
            : List<OptionModel>.from(json["options"].map((x) => OptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image != null ? null : image!.toJson(),
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class OptionModel {
  OptionModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  OptionModel copyWith({
    int? id,
    String? name,
  }) =>
      OptionModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
