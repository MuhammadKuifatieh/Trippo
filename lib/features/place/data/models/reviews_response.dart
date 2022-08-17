import 'dart:convert';

import 'package:trippo/core/data/models/user/user.dart';

import '../../../home/data/models/cities_response.dart';

ReviewsResponse reviewsResponseFromJson(String str) =>
    ReviewsResponse.fromJson(json.decode(str));

String reviewssResponseToJson(ReviewsResponse data) =>
    json.encode(data.toJson());

class ReviewsResponse {
  ReviewsResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  ReviewsDataModel? data;

  ReviewsResponse copyWith({
    bool? success,
    String? message,
    ReviewsDataModel? data,
  }) =>
      ReviewsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      ReviewsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ReviewsDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class ReviewsDataModel {
  ReviewsDataModel({
    this.comments,
    this.ratting,
  });

  List<ReviewModel>? comments;
  List<RattingModel>? ratting;

  ReviewsDataModel copyWith(
          {List<ReviewModel>? comments, List<RattingModel>? ratting}) =>
      ReviewsDataModel(
        comments: comments ?? this.comments,
        ratting: ratting ?? this.ratting,
      );

  factory ReviewsDataModel.fromJson(Map<String, dynamic> json) =>
      ReviewsDataModel(
        ratting: json["ratting"] == null
            ? null
            : List<RattingModel>.from(
                json["ratting"].map((x) => RattingModel.fromJson(x))),
        comments: json["comments"] == null
            ? null
            : List<ReviewModel>.from(
                json["comments"].map((x) => ReviewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "ratting": ratting == null
            ? null
            : List<dynamic>.from(ratting!.map((x) => x.toJson())),
      };
}

class ReviewModel {
  ReviewModel({
    this.id,
    this.tilte,
    this.description,
    this.rating,
    this.fullDate,
    this.visitType,
    this.createdAt,
    this.images,
    this.user,
  });

  int? id;
  String? tilte;
  String? description;
  dynamic rating;
  String? fullDate;
  String? visitType;
  DateTime? createdAt;
  List<ImageModel>? images;
  User? user;

  ReviewModel copyWith({
    int? id,
    String? tilte,
    String? description,
    dynamic rating,
    String? fullDate,
    String? visitType,
    DateTime? createdAt,
    List<ImageModel>? images,
    User? user,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        tilte: tilte ?? this.tilte,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        fullDate: fullDate ?? this.fullDate,
        visitType: visitType ?? this.visitType,
        createdAt: createdAt ?? this.createdAt,
        images: images ?? this.images,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        tilte: json["tilte"],
        description: json["description"],
        rating: json["rating"],
        fullDate: json["full_date"],
        visitType: json["visit_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        images: json["images"] == null
            ? null
            : List<ImageModel>.from(
                json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tilte": tilte,
        "description": description,
        "rating": rating,
        "full_date": fullDate,
        "visit_type": visitType,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "user": user == null ? null : user!.toJson(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class RattingModel {
  RattingModel({
    this.name,
    this.count,
  });

  String? name;
  int? count;

  RattingModel copyWith({
    String? name,
    int? count,
  }) =>
      RattingModel(
        name: name ?? this.name,
        count: count ?? this.count,
      );

  factory RattingModel.fromJson(Map<String, dynamic> json) => RattingModel(
        name: json["name"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
      };
}
