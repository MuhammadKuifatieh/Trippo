part of '../pages/setting_screen.dart';

class _ProfileSettingsWidget extends StatelessWidget {
  _ProfileSettingsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  final ValueNotifier<bool> notification = ValueNotifier(true);
  final ValueNotifier<bool> refresh = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.profileSetting,
          style: AppTextStyles.styleWeight600(
            fontSize: size.width * .045,
            color: Theme.of(context).primaryColor,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.editProfile,
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.changePassword,
        ),
        ValueListenableBuilder<bool>(
            valueListenable: notification,
            builder: (context, value, _) {
              return TextButtonProfile(
                size: size,
                title: AppLocalizations.of(context)!.sendPushNotifcation,
                onPressed: () {
                  notification.value = !value;
                },
                child: CupertinoSwitch(
                  value: value,
                  onChanged: (value) {
                    notification.value = value;
                  },
                ),
              );
            }),
        ValueListenableBuilder<bool>(
            valueListenable: refresh,
            builder: (context, value, _) {
              return TextButtonProfile(
                size: size,
                title: AppLocalizations.of(context)!.refreshAutomatically,
                onPressed: () {
                  refresh.value = !value;
                },
                child: CupertinoSwitch(
                  value: value,
                  onChanged: (value) {
                    refresh.value = value;
                  },
                ),
              );
            })
      ],
    );
  }
}
