import 'package:json_annotation/json_annotation.dart';
import 'package:trippo/features/home/data/models/places_response.dart';
part 'plan_content_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanContentModel {
  final int id;
  @JsonKey(name: 'full_date')
  final String? fullDate;
  final String? comment;
  final PlaceModel place;

  PlanContentModel({
    required this.id,
    required this.fullDate,
    this.comment,
    required this.place,
  });

  factory PlanContentModel.fromJson(Map<String, dynamic> json) {
    return _$PlanContentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlanContentModelToJson(this);
  }
}
