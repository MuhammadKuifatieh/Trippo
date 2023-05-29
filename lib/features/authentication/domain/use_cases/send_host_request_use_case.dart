import 'package:dartz/dartz.dart';
import 'package:trippo/core/error/failures.dart';
import 'package:trippo/core/use_case/use_case.dart';
import 'package:trippo/features/authentication/domain/repository/authentication_repository.dart';

class SendHostUseCase implements UseCase<bool, SendHostParams> {
  final AuthenticationRepository authenticationRepository;

  SendHostUseCase({required this.authenticationRepository});
  @override
  Future<Either<Failure, bool>> call(SendHostParams params) async {
    return await authenticationRepository.sendHostRequest(
      params: params.toMap(),
    );
  }
}

class SendHostParams {
  final String idFront;
  final String idBack;
  final int cityId;

  SendHostParams({
    required this.cityId,
    required this.idBack,
    required this.idFront,
  });

  Map<String, dynamic> toMap() {
    return {
      'idfront': idFront,
      'idback': idBack,
      'city_id': cityId,
    };
  }
}
