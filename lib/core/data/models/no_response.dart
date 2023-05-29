import 'dart:convert';

NoResponse noResponseFromJson(String str) => NoResponse.fromJson(str);

String noResponseToJson(NoResponse data) => json.encode(data.toJson());

class NoResponse {
  NoResponse({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final dynamic data;

  NoResponse copyWith({
    bool? success,
    String? message,
    dynamic data,
  }) =>
      NoResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory NoResponse.fromJson(String str) =>
      NoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NoResponse.fromMap(Map<String, dynamic> json) => NoResponse(
        success: json["success"],
        message: json["message"],
        data: null,
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
