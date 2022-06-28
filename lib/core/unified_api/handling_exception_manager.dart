import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../error/exception.dart';
import '../error/failures.dart';

mixin HandlingExceptionManager {
  Future<Either<Failure, T>> wrapHandling<T>(
      {required Future<Right<Failure, T>> Function() tryCall}) async {
    try {
      final right = await tryCall();
      return right;
    } on ServerException catch (e) {
      log("<< ServerException >> ${e.message}");
      return const Left(ServerFailure());
    } catch (e) {
      log("<< catch >> error is $e");
      return const Left(ServerFailure());
    }
  }
}
