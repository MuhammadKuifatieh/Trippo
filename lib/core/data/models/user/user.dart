import 'package:json_annotation/json_annotation.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey()
  final int id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey()
  final String? username;
  @JsonKey()
  final String? email;
  @JsonKey()
  final String? about;
  @JsonKey()
  final String? gender;
  @JsonKey(name: 'date_of_birthday')
  final String? dateOfBirth;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey()
  final String? latitude;
  @JsonKey()
  final String? longitude;
  @JsonKey()
  final ImageModel? image;

  User( {this.image,
    required this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.about,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    this.latitude,
    this.longitude,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

// "user": {
//       "id": "1",
//       "first_name": "Mohamad",
//       "last_name": "Rasoul",
//       "username": "mohamad_ra",
//       "email": "mralmaahlol@gmail.com",
//       "about": "this is my profile",
//       "gender": "male",
//       "date_of_birthday": "1998-09-15T00:00:00.000000Z",
//       "phone_number": "0958600569",
//       "latitude": "36.1654",
//       "longitude": "37.1545"
//     },