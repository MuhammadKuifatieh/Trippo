import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/city_repository.dart';

class DeleteQuestionUseCase extends UseCase<bool, int> {
  final CityRepository cityRepository;

  DeleteQuestionUseCase({required this.cityRepository});
  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await cityRepository.deleteQuestion(id);
  }
}