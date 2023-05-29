import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/city_repository.dart';

class DeleteAnswerUseCase extends UseCase<bool, int> {
  final CityRepository cityRepository;

  DeleteAnswerUseCase({required this.cityRepository});
  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await cityRepository.deleteAnswer(id);
  }
}
