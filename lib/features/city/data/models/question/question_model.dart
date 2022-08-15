import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionModel {
  @JsonKey()
  final int id;
  @JsonKey()
  final String text;
  @JsonKey()
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.text,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return _$QuestionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionModelToJson(this);
  }
}

@JsonSerializable()
class AnswerModel {
  @JsonKey()
  final int id;
  @JsonKey()
  final String text;

  AnswerModel({
    required this.id,
    required this.text,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return _$AnswerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswerModelToJson(this);
  }
}
