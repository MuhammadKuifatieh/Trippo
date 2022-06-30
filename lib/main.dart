import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trippo/features/splash/presentation/screens/splash_screen.dart';

import 'core/bloc/language_manager/language_manager_bloc.dart';
import 'core/theme_app.dart';
import 'injection.dart' as di;
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageManagerBloc()..add(InitLanguageEvent()),
      child: BlocBuilder<LanguageManagerBloc, LanguageManagerState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            title: 'Trippo',
            theme: ThemeApp().getTheme(),
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            home: const SplashScreen(),
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
