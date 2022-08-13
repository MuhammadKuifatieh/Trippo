part of '../pages/profile_screen.dart';

class _SavedProfileWidget extends StatelessWidget {
  const _SavedProfileWidget({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: state.recentlyViewedPalces.length,
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
                imageUrl: state.recentlyViewedPalces[index].images![0].url!,
                width: size.width * .4,
                height: size.width * .4,
                borderRadius: const BorderRadiusDirectional.horizontal(
                  start: Radius.circular(15),
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
                    state.recentlyViewedPalces[index].name!,
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .4,
                    child: Text(
                      state.recentlyViewedPalces[index].about!,
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .04,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                  SizedBox(
                    width: size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            state.recentlyViewedPalces[index].cityName!,
                            style: AppTextStyles.styleWeight400(
                              fontSize: size.width * .035,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
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
                              state.recentlyViewedPalces[index].typeName!,
                              style: AppTextStyles.styleWeight600(
                                fontSize: size.width * .025,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
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
