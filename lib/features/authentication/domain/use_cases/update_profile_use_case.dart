import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/user/user.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class UpdateProfileUseCase
    implements UseCase<User, UpdateProfileParams> {
  final AuthenticationRepository authenticationRepository;

  UpdateProfileUseCase({required this.authenticationRepository});
  @override
  Future<Either<Failure, User>> call(
      UpdateProfileParams params) async {
    return await authenticationRepository.updateProfile(body: params.toMap(),id:params.id! );
  }
}

class UpdateProfileParams {
  final String? id;
  final String firstName;
  final String lastName;
  final String username;
  final String? about;
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;

  UpdateProfileParams( { 
    this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.about,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "about": about ?? 'null',
      "gender": gender ?? 'null',
      "date_of_birthday": dateOfBirth ?? '${DateTime.now().toIso8601String()}Z',
      "phone_number": phoneNumber ?? 'null',
    };
  }
}