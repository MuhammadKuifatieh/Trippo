import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/user/user.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, RegistrationResponse>> register(
      {required Map<String, dynamic> params});
  Future<Either<Failure, RegistrationResponse>> login(
      {required Map<String, dynamic> params});

  Future<Either<Failure, bool>> sendHostRequest(
      {required Map<String, dynamic> params});
      Future<Either<Failure, User>> updateProfile(
      {required Map<String, dynamic> body,required String id});
}
