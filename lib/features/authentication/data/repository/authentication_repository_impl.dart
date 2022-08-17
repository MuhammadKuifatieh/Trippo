import 'package:trippo/core/data/models/user/user.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trippo/core/unified_api/handling_exception_manager.dart';
import 'package:trippo/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:trippo/features/authentication/data/data_sources/update_profile_remote_data_source.dart';
import 'package:trippo/features/authentication/data/models/registration_response/registration_response.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepostitoryImp
    with HandlingExceptionManager
    implements AuthenticationRepository {
  final _authDataSource = AuthenticationDataSource();
  final _updateProfileDataSource = UpdateProfileRemoteDataSource();
  @override
  Future<Either<Failure, RegistrationResponse>> register(
      {required Map<String, dynamic> params}) async {
    return wrapHandling<RegistrationResponse>(
      tryCall: () async {
        final model = await _authDataSource.register(body: params);
        return Right(model);
      },
    );
  }

  @override
  Future<Either<Failure, RegistrationResponse>> login(
      {required Map<String, dynamic> params}) async {
    return wrapHandling<RegistrationResponse>(
      tryCall: () async {
        final model = await _authDataSource.login(body: params);
        return Right(model);
      },
    );
  }



  @override
  Future<Either<Failure, bool>> sendHostRequest(
      {required Map<String, dynamic> params}) async {
    return wrapHandling<bool>(
      tryCall: () async {
        final res = await _authDataSource.sendHostRequest(body: params);
        return Right(res);
  
}
    );
      }
  @override

      Future<Either<Failure, User>> updateProfile({required String id,required Map<String, dynamic> body,})async {
    return wrapHandling<User>(
      tryCall: () async {
        final model = await _updateProfileDataSource.updateProfileDataSource(id: id,body: body);
        return Right(model);
      },
    );
  }

 
}
