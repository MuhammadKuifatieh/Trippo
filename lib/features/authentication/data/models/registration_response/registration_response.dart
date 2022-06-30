import 'package:json_annotation/json_annotation.dart';
import 'package:trippo/core/models/user/user.dart';

part 'registration_response.g.dart';
@JsonSerializable(explicitToJson: true)
class RegistrationResponse {
  @JsonKey()
  final User user;
  @JsonKey()
  final String token;

  RegistrationResponse({
    required this.user,
    required this.token,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return _$RegistrationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationResponseToJson(this);
  }
}
