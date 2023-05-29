import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
 

  const Failure();
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure();
}

class BusIsFullFailure extends Failure {
  const BusIsFullFailure();
}

class SeatIsNotAvailableFailure extends Failure {
  const SeatIsNotAvailableFailure();
}

