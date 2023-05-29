part of '../pages/setting_screen.dart';

class _SettingAppBarTitle extends StatelessWidget {
  const _SettingAppBarTitle({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProfileScreen.routeName,
        );
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: size.width * .025,
              end: size.width * .025,
            ),
            child: Hero(
              tag: HeroTag.imageProfile,
              child: CacheImage(
                width: size.width * .25,
                height: size.width * .25,
                shape: BoxShape.circle,
                imageUrl: GlobalFunctions.getUserInfo()!.image?.url ??
                    'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg',
              ),
            ),
          ),
          SizedBox(
            width: size.width * .44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  GlobalFunctions.getUserInfo()!.firstName! +
                      " " +
                      GlobalFunctions.getUserInfo()!.lastName!,
                  style: AppTextStyles.styleWeight600(
                    fontSize: size.width * .06,
                  ),
                ),
                Text(
                  GlobalFunctions.getUserInfo()!.email!,
                  style: AppTextStyles.styleWeight400(
                    fontSize: size.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width * .075),
          Icon(
            GlobalFunctions().isRTLDirectionality(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: size.width * .1,
          ),
        ],
      ),
    );
  }
}
