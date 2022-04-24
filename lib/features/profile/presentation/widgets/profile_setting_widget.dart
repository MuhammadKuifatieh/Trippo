part of '../pages/setting_screen.dart';

class _ProfileSettingsWidget extends StatelessWidget {
  const _ProfileSettingsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
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
          onPressed: () {
            Navigator.of(context).pushNamed(
              ProfileScreen.routeName,
            );
          },
          title: AppLocalizations.of(context)!.editProfile,
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.changePassword,
        ),
        TextButtonProfile(
          size: size,
          title: AppLocalizations.of(context)!.sendPushNotifcation,
          onPressed: () {},
          child: CupertinoSwitch(
            value: true,
            onChanged: (value) {},
          ),
        ),
        TextButtonProfile(
          size: size,
          title: AppLocalizations.of(context)!.refreshAutomatically,
          onPressed: () {},
          child: CupertinoSwitch(
            value: false,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
