part of '../pages/map_screen.dart';

class _MapSlider extends StatelessWidget {
  const _MapSlider({
    Key? key,
    required this.size,
    required this.isExpanded,
    required this.heightOpen,
    required this.mapBloc,
    required this.mapState,
    required this.mapController,
  }) : super(key: key);

  final Size size;
  final ValueNotifier<bool> isExpanded;
  final ValueNotifier<double> heightOpen;
  final MapBloc mapBloc;
  final MapState mapState;
  final Completer<GoogleMapController> mapController;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: heightOpen,
      builder: (context, heightOpen, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: isExpanded,
          builder: (context, isExpanded, _) {
            return Expanded(
              child: mapState.initLocationStatus == InitLocationStatus.init
                  ? SizedBox(
                      height: size.height * .6,
                      child: Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: Theme.of(context).primaryColor,
                          size: size.width * .1,
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: (controller) async {
                            String mapStyle =
                                await DefaultAssetBundle.of(context)
                                    .loadString("assets/map_style.json");
                            controller.setMapStyle(mapStyle);
                            mapController.complete(controller);
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              mapState.latitude!,
                              mapState.longitude!,
                            ),
                            zoom: 16,
                          ),
                          zoomControlsEnabled: false,
                          onCameraIdle: () {
                            mapController.future.then((value) {
                              value.getVisibleRegion().then((value) {
                                mapBloc.add(ChangeFitterValueEvent(
                                  latLngBounds: value,
                                ));
                              });
                            });
                          },
                        ),
                        Center(
                          child: Icon(
                            TrippoIcons.location,
                            color: Theme.of(context).primaryColor,
                            size: size.width * .1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onVerticalDragUpdate: (details) =>
                                      onVerticalDragUpdate(details, heightOpen),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.vertical(
                                        top: isExpanded
                                            ? Radius.zero
                                            : const Radius.elliptical(50, 50),
                                      ),
                                    ),
                                    width: size.width,
                                    height: size.height * .06,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width * .225,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        Text(
                                          '+300 Resturant to visit',
                                          style: AppTextStyles.styleWeight500(
                                            fontSize: size.width * .04,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  // height: size.height,
                                  height: heightOpen,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  child: SizedBox(
                                    height: size.height * .8,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: mapState.palces.length,
                                      itemBuilder: (context, index) {
                                        return MapListImage(
                                          place: mapState.palces[index],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }

  onVerticalDragUpdate(DragUpdateDetails details, double heightOpen) {
    if ((details.delta.dy < 0 && heightOpen <= size.height * .655) ||
        (details.delta.dy > 0 && heightOpen >= 0)) {
      if ((heightOpen - (details.delta.dy * 8)) < size.height * .0) {
        this.heightOpen.value = 0;
        isExpanded.value = false;
      } else if ((details.delta.dy < 0) &&
          ((heightOpen - (details.delta.dy * 7)) > size.height * .5)) {
        isExpanded.value = true;
        this.heightOpen.value = size.height * .655;
      } else {
        this.heightOpen.value = heightOpen - details.delta.dy * 7;
        isExpanded.value = false;
      }
    }
    log("update" + details.delta.toString());
  }
}
