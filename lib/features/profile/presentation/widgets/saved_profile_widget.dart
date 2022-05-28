part of '../pages/profile_screen.dart';

class _SavedProfileWidget extends StatelessWidget {
  const _SavedProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(size.width * .025),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              CacheImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dHJpcHxlbnwwfHwwfHw%3D&w=1000&q=80',
                width: size.width * .4,
                height: size.width * .4,
                borderRadius: BorderRadiusDirectional.horizontal(
                  start: const Radius.elliptical(15, 15),
                ),
              ),
              SizedBox(
                width: size.width * .025,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Skeletons of Olmos: ',
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Text(
                    'Uncovering a Mystery ',
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(height: size.width * .05),
                  Row(
                    children: [
                      const MainRatingBar(),
                      SizedBox(width: size.width * .02),
                      Text(
                        '56,645',
                        style: AppTextStyles.styleWeight600(
                          color: Colors.grey,
                          fontSize: size.width * .0275,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Syria, Aleppo',
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .035,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: size.width * .075),
                      Container(
                        width: size.width * .2,
                        height: size.width * .06,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1.5,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Resturant',
                            style: AppTextStyles.styleWeight600(
                              fontSize: size.width * .025,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
