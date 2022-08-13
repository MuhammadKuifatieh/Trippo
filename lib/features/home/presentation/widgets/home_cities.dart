part of '../pages/home_screen.dart';

class _HomeCities extends StatelessWidget {
  const _HomeCities({
    Key? key,
    required this.size,
    required this.title,
    required this.cities,
    required this.onTapRety,
    required this.isFalied,
    required this.isLoading,
    required this.descreption,
  }) : super(key: key);

  final Size size;
  final String title;
  final bool isFalied;
  final bool isLoading;
  final String descreption;
  final VoidCallback onTapRety;
  final List<CityModel> cities;

  @override
  Widget build(BuildContext context) {
    return (!isLoading && !isFalied && cities.isEmpty)
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .06,
                ),
              ),
              Text(
                descreption,
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .04,
                ),
              ),
              SizedBox(height: size.width * .025),
              SizedBox(
                height: size.width * .625,
                child: isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade400,
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(end: 8.0),
                            width: size.width * .6,
                            height: size.width * .6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : isFalied
                        ? MainErrorWidget(
                            onTapRety: onTapRety,
                            size: size,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cities.length,
                            itemBuilder: (contex, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(CityScreen.routeName);
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 8.0),
                                  child: SizedBox(
                                    width: size.width * .6,
                                    child: Stack(
                                      children: [
                                        CacheImage(
                                          width: size.width * .6,
                                          height: size.width * .6,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 1.5,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                          imageUrl:
                                              cities[index].images![0].url!,
                                          hash: cities[index].images![0].hash!,
                                        ),
                                        PositionedDirectional(
                                          bottom: size.width * .075,
                                          start: size.width * .025,
                                          child: SizedBox(
                                            width: size.width * .435,
                                            child: Text(
                                              cities[index].name!,
                                              style:
                                                  AppTextStyles.styleWeight900(
                                                color: Colors.white,
                                                fontSize: size.width * .045,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          );
  }
}
