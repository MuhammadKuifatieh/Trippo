part of 'language_manager_bloc.dart';

abstract class LanguageManagerEvent {
  const LanguageManagerEvent();
}

class InitLanguageEvent extends LanguageManagerEvent {
  InitLanguageEvent();
}

class ChangeLanguageEvent extends LanguageManagerEvent {
  final Locale newLocale;

  ChangeLanguageEvent({required this.newLocale});
}
