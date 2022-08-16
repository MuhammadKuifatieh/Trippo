// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanContentModel _$PlanContentModelFromJson(Map<String, dynamic> json) =>
    PlanContentModel(
      id: json['id'] as int,
      fullDate: json['full_date'] as String?,
      comment: json['comment'] as String?,
      place: PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanContentModelToJson(PlanContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_date': instance.fullDate,
      'comment': instance.comment,
      'place': instance.place.toJson(),
    };
