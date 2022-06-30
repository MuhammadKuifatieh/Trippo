import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepostitoryImp implements AuthenticationRepository {
  final _authDataSource = AuthenticationDataSource();

  @override
  Future<Either<Failure, RegistrationResponse>> register(
      {required Map<String, dynamic> params}) async {
    return HandlingExceptionManager.wrapHandling<RegistrationResponse>(
      tryCall: () async {
        final model = await _authDataSource.register(body: params);
        return Right(model);
      },
    );
  }

  @override
  Future<Either<Failure, RegistrationResponse>> login(
      {required Map<String, dynamic> params}) async {
    return HandlingExceptionManager.wrapHandling<RegistrationResponse>(
      tryCall: () async {
        final model = await _authDataSource.login(body: params);
        return Right(model);
      },
    );
  }
}
