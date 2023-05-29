import 'dart:convert';

import 'cities_response.dart';

PlacesResponse placesResponseFromJson(String str) =>
    PlacesResponse.fromJson(json.decode(str));

String placesResponseToJson(PlacesResponse data) => json.encode(data.toJson());

class PlacesResponse {
  PlacesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  PlaceDataModel? data;

  PlacesResponse copyWith({
    bool? success,
    String? message,
    PlaceDataModel? data,
  }) =>
      PlacesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : PlaceDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class PlaceDataModel {
  PlaceDataModel({
    this.places,
  });

  List<PlaceModel>? places;

  PlaceDataModel copyWith({
    List<PlaceModel>? places,
  }) =>
      PlaceDataModel(
        places: places ?? this.places,
      );

  factory PlaceDataModel.fromJson(Map<String, dynamic> json) => PlaceDataModel(
        places: json["places"] == null
            ? null
            : List<PlaceModel>.from(
                json["places"].map((x) => PlaceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": places == null
            ? null
            : List<dynamic>.from(places!.map((x) => x.toJson())),
      };
}

class PlaceModel {
  PlaceModel({
    this.id,
    this.name,
    this.about,
    this.address,
    this.latitude,
    this.longitude,
    this.ratting,
    this.rattingCount,
    this.cityName,
    this.typeName,
    this.views,
    this.webSite,
    this.phoneNumber,
    this.email,
    this.openAt,
    this.closeAt,
    this.isOpen,
    this.createdAt,
    this.images,
    this.awards,
    this.isFavorite = false,
    this.cityId,
  });

  int? id;
  String? name;
  String? about;
  String? address;
  double? latitude;
  double? longitude;
  int? ratting;
  int? rattingCount;
  int? views;
  String? cityName;
  String? typeName;
  String? webSite;
  String? phoneNumber;
  String? email;
  String? openAt;
  String? closeAt;
  bool? isOpen;
  DateTime? createdAt;
  bool? isFavorite;
  List<ImageModel>? images;
  List<AwardModel>? awards;
  int? cityId;

  PlaceModel copyWith({
    int? id,
    String? name,
    String? about,
    String? address,
    double? latitude,
    double? longitude,
    int? ratting,
    int? rattingCount,
    String? cityName,
    String? typeName,
    int? views,
    String? webSite,
    String? phoneNumber,
    String? email,
    String? openAt,
    String? closeAt,
    bool? isFavorite,
    bool? isOpen,
    DateTime? createdAt,
    List<ImageModel>? images,
    List<AwardModel>? awards,
    int? cityId,
  }) =>
      PlaceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        ratting: ratting ?? this.ratting,
        rattingCount: rattingCount ?? this.rattingCount,
        views: views ?? this.views,
        webSite: webSite ?? this.webSite,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        openAt: openAt ?? this.openAt,
        closeAt: closeAt ?? this.closeAt,
        createdAt: createdAt ?? this.createdAt,
        images: images ?? this.images,
        isOpen: isOpen ?? this.isOpen,
        awards: awards ?? this.awards,
        cityName: cityName ?? this.cityName,
        isFavorite: isFavorite ?? this.isFavorite,
        typeName: typeName ?? this.typeName,
        cityId: cityId ?? this.cityId,
      );

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
      id: json["id"],
      name: json["name"],
      about: json["about"],
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      ratting: json["ratting"],
      rattingCount: json["ratting_count"],
      typeName: json["type"],
      cityName: json["city"],
      views: json["views"],
      webSite: json["web_site"],
      phoneNumber: json["phone_number"],
      email: json["email"],
      openAt: json["open_at"],
      closeAt: json["close_at"],
      isOpen: json["is_open"],
      isFavorite: json["is_favourite"],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json["created_at"]),
      images: json["images"] == null
          ? null
          : List<ImageModel>.from(
              json["images"].map((x) => ImageModel.fromJson(x))),
      awards: json["awards"] == null
          ? null
          : List<AwardModel>.from(
              json["awards"].map((x) => AwardModel.fromJson(x))),
      cityId: json['city_id']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "ratting": ratting,
        "is_favourite": isFavorite,
        "ratting_count": rattingCount,
        "city": cityName,
        "views": views,
        "type": typeName,
        "web_site": webSite,
        "phone_number": phoneNumber,
        "email": email,
        "open_at": openAt,
        "close_at": closeAt,
        "is_open": isOpen,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "awards": awards == null
            ? null
            : List<dynamic>.from(awards!.map((x) => x.toJson())),
        'city_id': cityId,
      };
}

AwardModel awardsModelFromJson(String str) =>
    AwardModel.fromJson(json.decode(str));

String awardsModelToJson(AwardModel data) => json.encode(data.toJson());

class AwardModel {
  AwardModel({
    this.id,
    this.name,
    this.description,
    this.donor,
    this.image,
  });

  int? id;
  String? name;
  String? description;
  String? donor;
  ImageModel? image;

  AwardModel copyWith({
    int? id,
    String? name,
    String? description,
    String? donor,
    ImageModel? image,
  }) =>
      AwardModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        donor: donor ?? this.donor,
        image: image ?? this.image,
      );

  factory AwardModel.fromJson(Map<String, dynamic> json) => AwardModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        donor: json["donor"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "donor": donor,
        "image": image == null ? null : image!.toJson(),
      };
}
