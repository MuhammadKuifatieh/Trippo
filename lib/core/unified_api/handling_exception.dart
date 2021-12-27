import 'dart:async';

import 'package:dartz/dartz.dart';

import '../error/exception.dart';
import '../error/failures.dart';

typedef Future<T> _RequestCall<T>();

mixin HandlingExceptionRequest {
  Exception getException({required int statusCode}) {
    return ServerException();
  }

  Future<Either<Failure, T>> handlingExceptionRequest<T>(
      {required _RequestCall requestCall}) async {
    try {
      final response = await requestCall();
      return Right(response);
    } on ServerException {
      print("<< ServerException >> ");
      return Left(ServerFailure());
    } catch (e) {
      print("<< catch >> error is $e");
      return Left(ServerFailure());
    }
  }
}
