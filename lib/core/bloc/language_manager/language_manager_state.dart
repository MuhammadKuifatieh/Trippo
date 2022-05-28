part of 'language_manager_bloc.dart';

enum LanguageManagerStatus {
  init,
  succ,
  loading,
  falied,
}

class LanguageManagerState {
  final Locale locale;
  final List<String> supportedLocalesName;
  final LanguageManagerStatus status;
  const LanguageManagerState({
    this.locale = const Locale('ar', ''),
    this.supportedLocalesName = const [],
    this.status = LanguageManagerStatus.init,
  });
  LanguageManagerState copyWith({
    Locale? locale,
    LanguageManagerStatus? status,
    List<String>? supportedLocalesName,
  }) {
    return LanguageManagerState(
      locale: locale ?? this.locale,
      status: status ?? this.status,
      supportedLocalesName: supportedLocalesName ?? this.supportedLocalesName,
    );
  }
}
