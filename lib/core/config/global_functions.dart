import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippo/core/data/models/user/user.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../injection.dart';
import '../constants/prefs_keys.dart';

class GlobalFunctions {
  bool isRTLDirectionality(context) {
    return (AppLocalizations.of(context)!.localeName == 'ar');
  }

  Future<String> getLanguage() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    String language = _sp.getString(PrefsKeys.languageApp)!;
    return language;
  }

  static String? getToken() {
    final prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(PrefsKeys.accessToken);
  }

  static User? getUserInfo() {
    final prefs = serviceLocator<SharedPreferences>();
    return User.fromJson(jsonDecode(prefs.getString(PrefsKeys.userInfo)!));
  }

  launchWeb(String url) {
    launchUrl(Uri.parse(url));
  }

  launchPhoneNumber(String phoneNumber) {
    launchUrl(Uri.parse("tel:$phoneNumber"));
  }

  launchEmail(String email) {
    launchUrl(Uri.parse("mailto:$email"));
  }

  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return location.getLocation();
  }

  Future<String> getFCMToken({bool getFCMToken = false}) async {
    return "";
    // SharedPreferences _sp = await SharedPreferences.getInstance();
    // late String? token;

    // if (_sp.containsKey(PrefsKeys.fcmToken) && !getFCMToken) {
    // token = _sp.getString(PrefsKeys.fcmToken)!;
    // } else {
    // token = await FirebaseMessaging.instance.getToken();
    // token = (await FirebaseMessaging.instance.getToken());
    // _sp.setString(PrefsKeys.fcmToken, token!);
    // }

    // log(token, name: 'FcmHelper ==> initFCM ==> fcm token');

    // return token;
  }

  // Future<User> getUserInfo() async {
  //   SharedPreferences _sp = await SharedPreferences.getInstance();
  //   User userInfo = User.fromJson(_sp.getString(PrefsKeys.USERINFO)!);
  //   return userInfo;
  // }

  // logOut(BuildContext context) async {
  //   BotToast.showCustomLoading(toastBuilder: (_) {
  //     return getLoading(context: context);
  //   });
  //   SharedPreferences _sp = await SharedPreferences.getInstance();
  //   _sp.remove(PrefsKeys.TOKEN);
  //   _sp.remove(PrefsKeys.USERINFO);

  //   BotToast.closeAllLoading();
  //   // RestartWidget.restartApp(context);
  //   exit(0);
  // }

  Future<bool> isAuth() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    return _sp.containsKey(PrefsKeys.userInfo);
  }
}
