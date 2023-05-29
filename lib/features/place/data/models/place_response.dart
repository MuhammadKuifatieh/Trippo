import 'dart:convert';

import '../../../home/data/models/places_response.dart';

PlaceResponse placeResponseFromJson(String str) =>
    PlaceResponse.fromJson(json.decode(str));

String placeResponseToJson(PlaceResponse data) => json.encode(data.toJson());

class PlaceResponse {
  PlaceResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  PlaceDataModel? data;

  PlaceResponse copyWith({
    bool? success,
    String? message,
    PlaceDataModel? data,
  }) =>
      PlaceResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => PlaceResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : PlaceDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class PlaceDataModel {
  PlaceDataModel({
    this.place,
  });

  PlaceModel? place;

  PlaceDataModel copyWith({
    PlaceModel? place,
  }) =>
      PlaceDataModel(
        place: place ?? this.place,
      );

  factory PlaceDataModel.fromJson(Map<String, dynamic> json) => PlaceDataModel(
        place:
            json["place"] == null ? null : PlaceModel.fromJson(json["place"]),
      );

  Map<String, dynamic> toJson() => {
        "place": place == null ? null : place!.toJson(),
      };
}
