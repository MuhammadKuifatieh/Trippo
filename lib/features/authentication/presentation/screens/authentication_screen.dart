import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/design/design_constants.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_sheet_content.dart';
import 'package:trippo/features/authentication/presentation/widgets/facebook_auth_button.dart';
import 'package:trippo/features/authentication/presentation/widgets/google_auth_button.dart';
import 'package:trippo/features/main/presentation/pages/main_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const routeName = '/authentication';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late final AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => authenticationBloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.success) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const MainScreen();
              }),
              (route) => false,
            );
          } else if (state.status == AuthenticationStatus.failed) {
            BotToast.showText(text: 'There was something wrong');
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: screenHorizontalPadding, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: AssetSvg(
                              SvgImages.arrowBackward,
                              height: 30,
                              color: Theme.of(context).primaryColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth * 0.36,
                      height: screenWidth * 0.36,
                      child: Placeholder(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    SizedBox(
                      width: screenWidth * 0.51,
                      child: Text(
                        'Discover new places and find new adventures.',
                        style: AppTextStyles.styleWeight500(
                          color: const Color(0xff666666),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Text(
                      'Login To Your Account',
                      style: AppTextStyles.styleWeight300(
                        fontSize: 28,
                        color: const Color(0xff09051C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      width: screenWidth * 0.67,
                      child: Text(
                        'Before enjoying Trippo services Please register first',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.styleWeight400(
                          fontSize: 15,
                          color: const Color(0xff999999),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    const GoogleAuthButton(),
                    SizedBox(height: screenHeight * 0.02),
                    const FacebookAuthButton(),
                    SizedBox(height: screenHeight * 0.02),
                    RoundedExpandedButton(
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        showAuthBottomSheet(
                            context: context, initialPageIndex: 1);
                      },
                      child: Text(
                        'Login',
                        style: AppTextStyles.styleWeight400(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    RoundedExpandedButton(
                      onTap: () {
                        showAuthBottomSheet(
                            context: context, initialPageIndex: 0);
                      },
                      color: const Color(0xffE0F4E8),
                      child: Text(
                        'Create Account',
                        style: AppTextStyles.styleWeight400(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showAuthBottomSheet({
    required BuildContext context,
    required int initialPageIndex,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      isScrollControlled: true,
      builder: (newContext) {
        return AuthSheetContent(
          initialPageIndex: initialPageIndex,
          authenticationBloc: authenticationBloc,
        );
      },
    );
  }
}
