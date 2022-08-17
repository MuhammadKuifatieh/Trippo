import 'package:json_annotation/json_annotation.dart';
import 'package:trippo/core/data/models/image_response.dart';
part 'plan_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanModel {
  @JsonKey()
  final int id;
  @JsonKey()
  final String name;
  @JsonKey()
  final String? description;
  @JsonKey()
  final ImageResponse? image;

  PlanModel({
    required this.id,
    required this.name,
    this.description,
    this.image,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return _$PlanModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlanModelToJson(this);
  }
}
