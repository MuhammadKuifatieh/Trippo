import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippo/core/constants/prefs_keys.dart';
import 'package:trippo/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:trippo/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:trippo/features/authentication/domain/use_cases/registration_use_case.dart';
import 'package:trippo/injection.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<RegistrationSubmitted>(_mapRegistrationSubmitted);
    on<LoginSubmitted>(_mapLoginSubmitted);
  }
  final _registrationUseCase = RegistrationUseCase(
      authenticationRepository: AuthenticationRepostitoryImp());
  final _loginUseCase =
      LoginUseCase(authenticationRepository: AuthenticationRepostitoryImp());
  final prefs = serviceLocator<SharedPreferences>();

  FutureOr<void> _mapRegistrationSubmitted(
      RegistrationSubmitted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthenticationStatus.loading));
    final result = await _registrationUseCase(event.params);

    await result.fold(
      (l) async {
        emit(state.copyWith(status: AuthenticationStatus.failed));
      },
      (response) async {
        prefs.setString(PrefsKeys.accessToken, response.token);
        prefs.setString(PrefsKeys.userInfo, jsonEncode(response.toJson()));
        emit(state.copyWith(status: AuthenticationStatus.success));
      },
    );
  }

  FutureOr<void> _mapLoginSubmitted(
      LoginSubmitted event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: AuthenticationStatus.loading));
    final result = await _loginUseCase(event.params);

    await result.fold(
      (l) async {
        emit(state.copyWith(status: AuthenticationStatus.failed));
      },
      (response) async {
        prefs.setString(PrefsKeys.accessToken, response.token);
        prefs.setString(PrefsKeys.userInfo, jsonEncode(response.toJson()));
        emit(state.copyWith(status: AuthenticationStatus.success));
      },
    );
  }
}
