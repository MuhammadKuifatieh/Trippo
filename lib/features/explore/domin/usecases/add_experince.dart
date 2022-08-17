import 'package:dartz/dartz.dart';
import 'package:trippo/core/data/models/no_response.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/add_experince_response.dart';
import '../repositories/experince_repository.dart';

class AddExperince implements UseCase<NoResponse, AddExperinceParams> {
  final ExperinceRepository experinceRepository;

  AddExperince({required this.experinceRepository});
  @override
  Future<Either<Failure, NoResponse>> call(AddExperinceParams params) async {
    return experinceRepository.addExperince(params.getBody());
  }
}

class AddExperinceParams {
  final String name;
  final String about;
  final String address;
  final String price;
  final List<String> placeId;
  final List<String?> images;

  AddExperinceParams({
    required this.name,
    required this.about,
    required this.address,
    required this.price,
    required this.placeId,
    required this.images,
  });
  Map<String, dynamic> getBody() {
    return {
      "name": name,
      "about": about,
      "address": address,
      "price_begin": price,
      "places": placeId,
      "images": images,
    };
  }
}
