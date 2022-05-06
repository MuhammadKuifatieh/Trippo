part of '../pages/home_screen.dart';

class _HomeCities extends StatelessWidget {
  const _HomeCities({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: SizedBox(
              width: size.width * .46,
              child: Stack(
                children: [
                  CacheImage(
                    width: size.width * .46,
                    height: size.width * .7,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 1.5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    imageUrl: imageUrl,
                  ),
                  PositionedDirectional(
                    start: size.width * .025,
                    top: size.width * .025,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * .015,
                        vertical: size.width * .005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: size.width * .015,
                          ),
                          SizedBox(width: size.width * .01),
                          Text(
                            '4.1',
                            style: AppTextStyles.styleWeight400(
                              color: Colors.white,
                              fontSize: size.width * 0.03,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: size.width * .075,
                    start: size.width * .025,
                    child: Text(
                      'Damascus',
                      style: AppTextStyles.styleWeight900(
                        color: Colors.white,
                        fontSize: size.width * .055,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
