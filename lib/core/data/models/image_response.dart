import 'dart:convert';

ImageResponse imageResponseFromJson(String str) => ImageResponse.fromJson(json.decode(str));

String imageResponseToJson(ImageResponse data) => json.encode(data.toJson());

class ImageResponse {
  ImageResponse({
    this.id,
    this.url,
    this.order,
    this.hash,
  });

  int? id;
  String? url;
  int? order;
  String? hash;

  ImageResponse copyWith({
    int? id,
    String? url,
    int? order,
    String? hash,
  }) =>
      ImageResponse(
        id: id ?? this.id,
        url: url ?? this.url,
        order: order ?? this.order,
        hash: hash ?? this.hash,
      );

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        id: json["id"],
        url: json["url"],
        order: json["order"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "order": order,
        "hash": hash,
      };
}
