import 'dart:convert';

import '../../../../core/data/models/user/user.dart';
import '../../../home/data/models/cities_response.dart';
import '../../../home/data/models/places_response.dart';

ExperiencesResponse experiencesResponseFromJson(String str) =>
    ExperiencesResponse.fromJson(json.decode(str));

String experiencesResponseToJson(ExperiencesResponse data) =>
    json.encode(data.toJson());

class ExperiencesResponse {
  ExperiencesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  ExperiencesDataModel? data;

  ExperiencesResponse copyWith({
    bool? success,
    String? message,
    ExperiencesDataModel? data,
  }) =>
      ExperiencesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ExperiencesResponse.fromJson(Map<String, dynamic> json) =>
      ExperiencesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ExperiencesDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class ExperiencesDataModel {
  ExperiencesDataModel({
    this.experiences,
  });

  List<ExperienceModel>? experiences;

  ExperiencesDataModel copyWith({
    List<ExperienceModel>? experiences,
  }) =>
      ExperiencesDataModel(
        experiences: experiences ?? this.experiences,
      );

  factory ExperiencesDataModel.fromJson(Map<String, dynamic> json) => ExperiencesDataModel(
        experiences: json["experiences"] == null
            ? null
            : List<ExperienceModel>.from(
                json["experiences"].map((x) => ExperienceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "experiences": experiences == null
            ? null
            : List<dynamic>.from(experiences!.map((x) => x.toJson())),
      };
}

class ExperienceModel {
  ExperienceModel({
    this.id,
    this.name,
    this.about,
    this.ratting,
    this.views,
    this.priceBegin,
    this.address,
    this.latitude,
    this.longitude,
    this.images,
    this.user,
    this.places,
    this.bookings,
  });

  int? id;
  String? name;
  String? about;
  int? ratting;
  int? views;
  int? priceBegin;
  String? address;
  double? latitude;
  double? longitude;
  List<ImageModel>? images;
  User? user;
  List<PlaceModel>? places;
  List<BookingModel>? bookings;

  ExperienceModel copyWith({
    int? id,
    String? name,
    String? about,
    int? ratting,
    int? views,
    int? priceBegin,
    String? address,
    double? latitude,
    double? longitude,
    List<ImageModel>? images,
    User? user,
    List<PlaceModel>? places,
    List<BookingModel>? bookings,
  }) =>
      ExperienceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        ratting: ratting ?? this.ratting,
        views: views ?? this.views,
        priceBegin: priceBegin ?? this.priceBegin,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        images: images ?? this.images,
        user: user ?? this.user,
        places: places ?? this.places,
        bookings: bookings ?? this.bookings,
      );

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        ratting: json["ratting"],
        views: json["views"],
        priceBegin: json["price_begin"],
        address: json["address"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        images: json["images"] == null
            ? null
            : List<ImageModel>.from(
                json["images"].map((x) => ImageModel.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        places: json["places"] == null
            ? null
            : List<PlaceModel>.from(json["places"].map((x) => PlaceModel.fromJson(x))),
        bookings: json["bookings"] == null
            ? null
            : List<BookingModel>.from(
                json["bookings"].map((x) => BookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "ratting": ratting,
        "views": views,
        "price_begin": priceBegin,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "user": user == null ? null : user!.toJson(),
        "places":
            places == null ? null : List<dynamic>.from(places!.map((x) => x)),
        "bookings": bookings == null
            ? null
            : List<dynamic>.from(bookings!.map((x) => x.toJson())),
      };
}

class BookingModel {
  BookingModel({
    this.id,
    this.name,
    this.price,
    this.peopleCount,
    this.isActive,
  });

  int? id;
  String? name;
  String? price;
  int? peopleCount;
  int? isActive;

  BookingModel copyWith({
    int? id,
    String? name,
    String? price,
    int? peopleCount,
    int? isActive,
  }) =>
      BookingModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        peopleCount: peopleCount ?? this.peopleCount,
        isActive: isActive ?? this.isActive,
      );

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        peopleCount: json["people_count"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "people_count": peopleCount,
        "is_active": isActive,
      };
}
