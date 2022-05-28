import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/prefs_keys.dart';

part 'language_manager_event.dart';
part 'language_manager_state.dart';

const List<Locale> supportedLocales = [
  Locale('en', ''),
  Locale('ar', ''),
];

class LanguageManagerBloc
    extends Bloc<LanguageManagerEvent, LanguageManagerState> {
  LanguageManagerBloc() : super(const LanguageManagerState()) {
    on<InitLanguageEvent>(_mapInitLanguageState);

    on<ChangeLanguageEvent>(_mapChangeLanguageState);
  }

  FutureOr<void> _mapInitLanguageState(
      InitLanguageEvent event, Emitter<LanguageManagerState> emit) async {
    emit(
      state.copyWith(
        status: LanguageManagerStatus.loading,
        supportedLocalesName: [
          'English',
          'العربية',
        ],
      ),
    );
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (_pref.containsKey(PrefsKeys.languageApp)) {
      log(_pref.getString(PrefsKeys.languageApp)!);
      emit(
        state.copyWith(
          status: LanguageManagerStatus.succ,
          locale: Locale(_pref.getString(PrefsKeys.languageApp)!),
        ),
      );
      return;
    } else {
      String localeName = Platform.localeName;
      for (var item in supportedLocales) {
        if (localeName.startsWith(item.languageCode)) {
          _pref.setString(PrefsKeys.languageApp, item.languageCode);
          emit(
            state.copyWith(
              locale: item,
              status: LanguageManagerStatus.succ,
            ),
          );
          return;
        }
      }
    }
    emit(
      state.copyWith(
        locale: const Locale('ar', ''),
        status: LanguageManagerStatus.succ,
      ),
    );
  }

  FutureOr<void> _mapChangeLanguageState(
      ChangeLanguageEvent event, Emitter<LanguageManagerState> emit) async {
    emit(state.copyWith(status: LanguageManagerStatus.loading));
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString(PrefsKeys.languageApp, event.newLocale.languageCode);
    emit(
      state.copyWith(
        status: LanguageManagerStatus.succ,
        locale: event.newLocale,
      ),
    );
    log(state.locale.languageCode);
  }
}
