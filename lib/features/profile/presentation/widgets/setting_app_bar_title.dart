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
                imageUrl:
                    "https://media-exp1.licdn.com/dms/image/C4E03AQEIZ8ds-8dtrw/profile-displayphoto-shrink_200_200/0/1623533074857?e=2147483647&v=beta&t=eFYm5aiC21gAVTXcQL-ZAxdhoo1AHFBt8IBUvnbmiUo",
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muahammad',
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .06,
                ),
              ),
              Text(
                'muhammad@gmail.co',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * 0.04,
                ),
              ),
            ],
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
