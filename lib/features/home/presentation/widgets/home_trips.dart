part of '../pages/home_screen.dart';

class _HomeTrips extends StatelessWidget {
  const _HomeTrips({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .925,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: SizedBox(
              width: size.width * .55,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      CacheImage(
                        width: size.width * .55,
                        height: size.width * .7,
                        imageUrl:
                            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 1.5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      PositionedDirectional(
                        end: size.width * .025,
                        top: size.width * .025,
                        child: Container(
                          width: size.width * .075,
                          height: size.width * .075,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(.4),
                          ),
                          child: Icon(
                            TrippoIcons.favorite,
                            color: Theme.of(context).errorColor,
                            size: size.width * .05,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        bottom: size.width * .025,
                        start: size.width * .025,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CacheImage(
                              imageUrl:
                                  'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
                              height: size.width * .1,
                              width: size.width * .1,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(width: size.width * .02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Syria, Aleppo',
                                  style: AppTextStyles.styleWeight400(
                                    color: Colors.white,
                                    fontSize: size.width * .035,
                                  ),
                                ),
                                Text(
                                  'From 20\$ /preson',
                                  style: AppTextStyles.styleWeight400(
                                    color: Colors.white,
                                    fontSize: size.width * .035,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.width * .035),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Westminster to Greenwich Sightseeing Thames Cruise in London',
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .0375,
                        ),
                      ),
                      SizedBox(height: size.width * .01),
                      Row(
                        children: [
                          const MainRatingBar(),
                          SizedBox(width: size.width * .02),
                          Text(
                            '56,645',
                            style: AppTextStyles.styleWeight600(
                              color: Colors.grey,
                              fontSize: size.width * .03,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
