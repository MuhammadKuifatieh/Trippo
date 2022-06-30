import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippo/core/config/global_functions.dart';
import 'package:trippo/injection.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEntered>(_mapSplashEntered);
  }
  final prefs = serviceLocator<SharedPreferences>();
  FutureOr<void> _mapSplashEntered(
      SplashEntered event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = GlobalFunctions.getToken();
    if (token == null) {
      emit(NotAuthenticated());
      return;
    }
    emit(Authenticated());
  }
}
