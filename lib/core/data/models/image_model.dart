import 'dart:convert';

ImageUploadModelResponse imageUploadModelResponseFromJson(String str) =>
    ImageUploadModelResponse.fromJson(str);

String imageUploadModelResponseToJson(ImageUploadModelResponse data) =>
    json.encode(data.toJson());

class ImageUploadModelResponse {
  ImageUploadModelResponse({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final ImageUploadModel? data;

  ImageUploadModelResponse copyWith({
    bool? success,
    String? message,
    ImageUploadModel? data,
  }) =>
      ImageUploadModelResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ImageUploadModelResponse.fromJson(String str) =>
      ImageUploadModelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageUploadModelResponse.fromMap(Map<String, dynamic> json) =>
      ImageUploadModelResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ImageUploadModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toMap(),
      };
}

ImageUploadModel imageUploadModelFromJson(String str) =>
    ImageUploadModel.fromJson(str);

String imageUploadModelToJson(ImageUploadModel data) =>
    json.encode(data.toJson());

class ImageUploadModel {
  ImageUploadModel({
    this.imageUrl,
  });

  final String? imageUrl;

  ImageUploadModel copyWith({
    String? imageUrl,
  }) =>
      ImageUploadModel(
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory ImageUploadModel.fromJson(String str) =>
      ImageUploadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageUploadModel.fromMap(Map<String, dynamic> json) =>
      ImageUploadModel(
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "imageUrl": imageUrl,
      };
}
