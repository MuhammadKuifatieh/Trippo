import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlobalFunction {
  bool isRTLDirectionality(context) {
    return (AppLocalizations.of(context)!.localeName == 'ar');
  }
}
