import 'dart:convert';

import '../../../home/data/models/cities_response.dart';

ImagesResponse imagesResponseFromJson(String str) =>
    ImagesResponse.fromJson(json.decode(str));

String imagesResponseToJson(ImagesResponse data) => json.encode(data.toJson());

class ImagesResponse {
  ImagesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  ImagesResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ImagesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ImagesResponse.fromJson(Map<String, dynamic> json) => ImagesResponse(
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
    this.images,
  });

  List<ImageModel>? images;

  Data copyWith({
    List<ImageModel>? images,
  }) =>
      Data(
        images: images ?? this.images,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: json["images"] == null
            ? null
            : List<ImageModel>.from(
                json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
