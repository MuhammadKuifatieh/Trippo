import 'dart:convert';

VisitTypesResponse visitTypesResponseFromJson(String str) =>
    VisitTypesResponse.fromJson(json.decode(str));

String visitTypesResponseToJson(VisitTypesResponse data) =>
    json.encode(data.toJson());

class VisitTypesResponse {
  VisitTypesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  VisitTypesDataModel? data;

  VisitTypesResponse copyWith({
    bool? success,
    String? message,
    VisitTypesDataModel? data,
  }) =>
      VisitTypesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VisitTypesResponse.fromJson(Map<String, dynamic> json) =>
      VisitTypesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : VisitTypesDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class VisitTypesDataModel {
  VisitTypesDataModel({
    this.visitTypes,
  });

  List<VisitTypeModel>? visitTypes;

  VisitTypesDataModel copyWith({
    List<VisitTypeModel>? visitTypes,
  }) =>
      VisitTypesDataModel(
        visitTypes: visitTypes ?? this.visitTypes,
      );

  factory VisitTypesDataModel.fromJson(Map<String, dynamic> json) => VisitTypesDataModel(
        visitTypes: json["visitTypes"] == null
            ? null
            : List<VisitTypeModel>.from(
                json["visitTypes"].map((x) => VisitTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "visitTypes": visitTypes == null
            ? null
            : List<dynamic>.from(visitTypes!.map((x) => x.toJson())),
      };
}

class VisitTypeModel {
  VisitTypeModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  VisitTypeModel copyWith({
    int? id,
    String? name,
  }) =>
      VisitTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory VisitTypeModel.fromJson(Map<String, dynamic> json) => VisitTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
