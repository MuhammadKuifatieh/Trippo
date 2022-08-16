
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippo/features/profile/presentation/pages/host_info_screen.dart';

import '../../../../core/bloc/language_manager/language_manager_bloc.dart';
import '../../../../core/config/global_functions.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/hero_tag.dart';
import '../../../../core/widgets/cache_image.dart';
import '../widgets/button_profile.dart';
import '../widgets/setting_check_box.dart';
import 'profile_screen.dart';

part '../widgets/preferences_widget.dart';
part '../widgets/profile_setting_widget.dart';
part '../widgets/setting_app_bar_title.dart';
part '../widgets/support_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String routeName = 'profile_screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: size.width * .35,
        elevation: .25,
        title: _SettingAppBarTitle(size: size),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: size.width * .025,
            end: size.width * .025,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * .125),
              _ProfileSettingsWidget(size: size),
              SizedBox(height: size.width * .1),
              _PerferencesWidget(size: size),
              SizedBox(height: size.width * .1),
              _SupportWidget(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
