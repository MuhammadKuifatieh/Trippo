import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class LoginUseCase
    implements UseCase<RegistrationResponse, LoginParams> {
  final AuthenticationRepository authenticationRepository;

  LoginUseCase({required this.authenticationRepository});
  @override
  Future<Either<Failure, RegistrationResponse>> call(LoginParams params) async {
    return await authenticationRepository.login(params: params.toMap());
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}
