import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:trippo/features/main/presentation/pages/main_screen.dart';
import 'package:trippo/features/splash/presentation/blocs/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashEntered()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const MainScreen();
              }),
              (route) => false,
            );
          } else if (state is NotAuthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const AuthenticationScreen();
              }),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Text(
              'Trippo',
              textAlign: TextAlign.center,
              style: AppTextStyles.styleWeight900(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
