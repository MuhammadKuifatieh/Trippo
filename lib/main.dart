import 'package:flutter/material.dart';
import 'package:trippo/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme_app.dart';
import 'features/main/presentation/pages/main_screen.dart';
import 'injection.dart' as di;
import 'router/app_router.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      title: 'Trippo',
      theme: ThemeApp().getTheme(),
      home: const MainScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
