part of 'authentication_bloc.dart';

enum AuthenticationStatus { initial, loading, success, failed }

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.initial,
  });

  final AuthenticationStatus status;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
