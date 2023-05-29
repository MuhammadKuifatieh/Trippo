part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationSubmitted extends AuthenticationEvent {
  final RegistrationParams params;

  const RegistrationSubmitted(this.params);
}

class LoginSubmitted extends AuthenticationEvent {
  final LoginParams params;

  const LoginSubmitted(this.params);
}
