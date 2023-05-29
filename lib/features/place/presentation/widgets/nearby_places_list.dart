part of '../pages/place_screen.dart';

class _NearbyPlacesList extends StatelessWidget {
  const _NearbyPlacesList({
    Key? key,
    required this.size,
    required this.placeBloc,
    required this.placeState,
  }) : super(key: key);

  final Size size;
  final PlaceBloc placeBloc;
  final PlaceState placeState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .65,
      child: placeState.nearbyPlacesStatus == NearbyPlacesStatus.loading ||
              placeState.nearbyPlacesStatus == NearbyPlacesStatus.init
          ? GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .5,
                mainAxisSpacing: size.width * .05,
                crossAxisSpacing: size.width * .05,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Row(
                  children: [
                    Container(
                      width: size.width * .3,
                      height: size.width * .3,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * .25,
                          height: size.width * .025,
                          color: Colors.grey,
                        ),
                        Container(
                          width: size.width * .25,
                          height: size.width * .035,
                          color: Colors.grey,
                        ),
                        Container(
                          width: size.width * .25,
                          height: size.width * .025,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : placeState.nearbyPlacesStatus == NearbyPlacesStatus.failed
              ? MainErrorWidget(
                  size: size,
                  onTapRety: () {
                    placeBloc.add(
                      GetNearbyPlacesEvent(
                        id: placeState.place!.id.toString(),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  itemCount: placeState.nearbyPlaces.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                    mainAxisSpacing: size.width * .05,
                    crossAxisSpacing: size.width * .05,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        PlaceScreen.routeName,
                        arguments: PlaceScreenParams(
                          id: placeState.nearbyPlaces[index].id.toString(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CacheImage(
                          width: size.width * .3,
                          height: size.width * .3,
                          borderRadius: BorderRadius.circular(15),
                          imageUrl:
                              placeState.nearbyPlaces[index].images![0].url!,
                          hash: placeState.nearbyPlaces[index].images![0].hash,
                        ),
                        SizedBox(width: size.width * .02),
                        SizedBox(
                          width: size.width * .275,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.width * .025),
                              Text(
                                placeState.nearbyPlaces[index].name!,
                                style: AppTextStyles.styleWeight400(
                                  fontSize: size.width * .04,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: size.width * .025),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MainRatingBar(
                                    isFiter: true,
                                    filterRating: double.parse(placeState
                                        .nearbyPlaces[index].ratting
                                        .toString()),
                                  ),
                                  Text(
                                    placeState.nearbyPlaces[index].rattingCount
                                        .toString(),
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .035,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: size.width * .025),
                              Flexible(
                                child: Text(
                                  placeState.nearbyPlaces[index].about!,
                                  style: AppTextStyles.styleWeight400(
                                    fontSize: size.width * .035,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
    );
  }
}
