import 'package:json_annotation/json_annotation.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';
part 'city_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CityModel {
  const CityModel({
    this.images,
    this.id,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? latitude;
  final String? longitude;
  final List<ImageModel>? images;
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return _$CityModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CityModelToJson(this);
  }
}
