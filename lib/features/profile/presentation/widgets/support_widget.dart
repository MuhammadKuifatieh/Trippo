part of '../pages/setting_screen.dart';

class _SupportWidget extends StatelessWidget {
   _SupportWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  User? user ;
  final pref = serviceLocator<SharedPreferences>();
    
  @override
  Widget build(BuildContext context) {
    String getUser = pref.getString(PrefsKeys.userInfo) ?? "";
    user = User.fromJson(jsonDecode(getUser));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.support,
          style: AppTextStyles.styleWeight600(
            fontSize: size.width * .045,
            color: Theme.of(context).primaryColor,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.support,
          child: Icon(
            GlobalFunctions().isRTLDirectionality(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: size.width * .075,
            color: Colors.grey.shade300,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.help,
          child: Icon(
            GlobalFunctions().isRTLDirectionality(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: size.width * .075,
            color: Colors.grey.shade300,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.faq,
          child: Icon(
            GlobalFunctions().isRTLDirectionality(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: size.width * .075,
            color: Colors.grey.shade300,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {
            if(!user!.isHost!) {
              Navigator.pushNamed(context, HostInfoScreen.routeName);
            }
Navigator.pushNamed(context,AddExperinceSrceen.routeName);
          },
          title: 'Transform to Host',
          child: Icon(
            GlobalFunctions().isRTLDirectionality(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: size.width * .075,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
