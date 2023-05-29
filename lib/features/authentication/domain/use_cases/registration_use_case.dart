import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class RegistrationUseCase
    implements UseCase<RegistrationResponse, RegistrationParams> {
  final AuthenticationRepository authenticationRepository;

  RegistrationUseCase({required this.authenticationRepository});
  @override
  Future<Either<Failure, RegistrationResponse>> call(
      RegistrationParams params) async {
    return await authenticationRepository.register(params: params.toMap());
  }
}

class RegistrationParams {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? about;
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? latitude;
  final String? longitude;

  RegistrationParams({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.about,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "about": about ?? 'null',
      "gender": gender ?? 'male',
      "date_of_birthday": dateOfBirth ?? '${DateTime.now().toIso8601String()}Z',
      "phone_number": phoneNumber ?? 'null',
      "latitude": latitude ?? 'null',
      "longitude": longitude ?? 'null',
    };
  }
}


// {
//   "first_name": "Mohamad",
//   "last_name": "Rasoul",
//   "username": "mohamad_ra",
//   "email": "mralmaahlol@gmail.com",
//   "password": "12345678",
//   "password_confirmation": "12345678",
//   "about": "this is my profile",
//   "gender": "male",
//   "date_of_birthday": "15-9-1998",
//   "phone_number": "0958600569",
//   "latitude": "36.1654",
//   "longitude": "37.1545"
// }
