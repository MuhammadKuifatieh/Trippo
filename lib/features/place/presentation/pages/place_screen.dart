import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/global_functions.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../home/data/models/cities_response.dart';
import '../../../home/data/models/places_response.dart';
import '../bloc/place/place_bloc.dart';
import '../widgets/review_bottom_sheet.dart';
import '../widgets/review_card.dart';
import '../widgets/review_result_card.dart';
import '../widgets/upload_image_bottom_sheet.dart';
import 'images_screen.dart';
import 'review_screen.dart';

part '../widgets/awards_widget.dart';
part '../widgets/nearby_places_list.dart';
part '../widgets/palce_app_bar.dart';

class PlaceScreen extends StatefulWidget {
  static const String routeName = 'place_screen';
  const PlaceScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final PlaceScreenParams arg;

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late SequenceAnimation sequenceAnimation;
  late PageController pageController;
  late ValueNotifier<int> indexValue;
  late ValueNotifier<String?> selectedTypeRatting;
  late Size size;
  late AppLocalizations appLocalizations;
  late final PlaceBloc placeBloc;
  late List<String> typeRatting;

  @override
  void initState() {
    super.initState();
    placeBloc = PlaceBloc()
      ..add(GetPlaceEvent(id: widget.arg.id))
      ..add(GetFirstReviewsEvent(placeId: widget.arg.id));
    pageController = PageController();
    indexValue = ValueNotifier(1);
    selectedTypeRatting = ValueNotifier(null);
    pageController.addListener(() {
      indexValue.value = pageController.page!.round() + 1;
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(
            begin: 0,
            end: 1,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "isOpen",
          curve: Curves.easeOut,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: 0.0,
            end: 0.8,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "opacity",
          curve: Curves.easeOut,
        )
        .animate(animationController);
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    appLocalizations = AppLocalizations.of(context)!;
    typeRatting = [
      appLocalizations.business,
      appLocalizations.family,
      appLocalizations.frinds,
      appLocalizations.solo,
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => placeBloc,
      child: BlocConsumer<PlaceBloc, PlaceState>(
        listener: (context, state) {
          if (state.uploadImagePlaceStatus == UploadImagePlaceStatus.loading) {
            BotToast.showLoading();
          } else if (state.uploadImagePlaceStatus ==
              UploadImagePlaceStatus.failed) {
            BotToast.closeAllLoading();
            BotToast.showText(text: appLocalizations.somethingWrong);
          } else if (state.uploadImagePlaceStatus ==
              UploadImagePlaceStatus.succ) {
            BotToast.closeAllLoading();
            BotToast.showText(text: appLocalizations.uploadDone);
            Navigator.of(context).pop();
          }
          if (state.addReviewToPlaceStatus == AddReviewToPlaceStatus.loading) {
            BotToast.showLoading();
          } else if (state.addReviewToPlaceStatus ==
              AddReviewToPlaceStatus.failed) {
            BotToast.closeAllLoading();
            BotToast.showText(text: appLocalizations.somethingWrong);
          } else if (state.addReviewToPlaceStatus ==
              AddReviewToPlaceStatus.succ) {
            BotToast.closeAllLoading();
            BotToast.showText(text: appLocalizations.reviewDone);
            Navigator.of(context).pop();
          }
          if (state.visitTypesStatus == VisitTypesStatus.loading) {
            BotToast.showLoading();
          } else if (state.visitTypesStatus == VisitTypesStatus.failed) {
            BotToast.closeAllLoading();
            BotToast.showText(text: appLocalizations.somethingWrong);
          } else if (state.visitTypesStatus == VisitTypesStatus.succ) {
            BotToast.closeAllLoading();
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              constraints: BoxConstraints(
                maxHeight: size.height * .9,
                minHeight: size.height * .8,
              ),
              builder: (_) => ReviewBottomSheet(
                size: size,
                selectedTypeRatting: selectedTypeRatting,
                typeRatting: typeRatting,
                placeBloc: placeBloc,
                placeState: state,
              ),
            );
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context, state.place!.isFavorite);
              return false;
            },
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    _PlaceAppBar(
                      size: size,
                      animationController: animationController,
                      sequenceAnimation: sequenceAnimation,
                      pageController: pageController,
                      indexValue: indexValue,
                      images: state.place?.images ?? [],
                      title: state.place?.name ?? "",
                      isFavorite: state.place?.isFavorite ?? false,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          PlaceImagesScreen.routeName,
                          arguments: PlaceImagesScreenParams(
                            placeBloc: placeBloc,
                            id: widget.arg.id,
                          ),
                        );
                      },
                      onTapFavorite: () {
                        placeBloc.add(
                          ChangeFavoriteStateEvent(id: widget.arg.id),
                        );
                      },
                      onTapPop: () {
                        Navigator.of(context).pop(state.place!.isFavorite);
                      },
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: (state.placeStatus == PlaceStatus.loading ||
                          state.placeStatus == PlaceStatus.init)
                      ? SizedBox(
                          height: size.height * .6,
                          child: Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: Theme.of(context).primaryColor,
                              size: size.width * .1,
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(size.width * .04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.place!.name!,
                                    style: AppTextStyles.styleWeight900(
                                      color: Colors.black,
                                      fontSize: size.width * .065,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .015),
                                  Row(
                                    children: [
                                      MainRatingBar(
                                        isFiter: true,
                                        filterRating: double.parse(
                                          state.place!.ratting.toString(),
                                        ),
                                        circleSize: size.width * .045,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        state.place!.rattingCount.toString(),
                                        style: AppTextStyles.styleWeight300(
                                          color: Colors.black,
                                          fontSize: size.width * .045,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * .015),
                                  Text(
                                    state.place!.about!,
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .03),
                                  Row(
                                    children: [
                                      MainButton(
                                        onTap: () {
                                          GlobalFunctions()
                                              .launchWeb(state.place!.webSite!);
                                        },
                                        width: size.width * .4,
                                        height: size.width * .1,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              appLocalizations.visitWebsite,
                                              style:
                                                  AppTextStyles.styleWeight400(
                                                color: Colors.white,
                                                fontSize: size.width * .035,
                                              ),
                                            ),
                                            SizedBox(width: size.width * .01),
                                            Icon(
                                              Icons.travel_explore_sharp,
                                              color: Colors.white,
                                              size: size.width * .05,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          MainButton(
                                            onTap: () {
                                              GlobalFunctions()
                                                  .launchPhoneNumber(state
                                                      .place!.phoneNumber!);
                                            },
                                            width: size.width * .15,
                                            height: size.width * .1,
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: size.width * .05,
                                            ),
                                          ),
                                          SizedBox(width: size.width * .025),
                                          MainButton(
                                            onTap: () {
                                              GlobalFunctions().launchEmail(
                                                state.place!.email!,
                                              );
                                            },
                                            width: size.width * .15,
                                            height: size.width * .1,
                                            child: Icon(
                                              Icons.email_outlined,
                                              color: Colors.white,
                                              size: size.width * .05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.width * .03),
                            Divider(
                              thickness: .5,
                              color: Theme.of(context).primaryColor,
                            ),

                            Padding(
                              padding: EdgeInsets.all(size.width * .04),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.place!.isOpen!
                                            ? appLocalizations.openNow
                                            : appLocalizations.closeNow,
                                        style: AppTextStyles.styleWeight600(
                                          fontSize: size.width * .04,
                                          color: state.place!.isOpen!
                                              ? Theme.of(context).primaryColor
                                              : Colors.red,
                                        ),
                                      ),
                                      Text(
                                        '${state.place!.openAt!.substring(0, 5)} - ${state.place!.closeAt!.substring(0, 5)}',
                                        style: AppTextStyles.styleWeight400(
                                          fontSize: size.width * .04,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Theme.of(context).primaryColor,
                            ),
                            // SizedBox(height: size.width * .025),
                            Padding(
                              padding: EdgeInsets.all(size.width * .04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _AwardsWidget(
                                    appLocalizations: appLocalizations,
                                    size: size,
                                    awards: state.place!.awards!,
                                  ),
                                  SizedBox(height: size.width * .04),
                                  Text(
                                    'الأوقات المقترحة للزيارة',
                                    style: AppTextStyles.styleWeight500(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                  Text(
                                    '2-3 hours',
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .1),
                                  Text(
                                    appLocalizations.location,
                                    style: AppTextStyles.styleWeight700(
                                      fontSize: size.width * .05,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .025),
                                  Text(
                                    appLocalizations.address,
                                    style: AppTextStyles.styleWeight600(
                                      fontSize: size.width * .0425,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .01),
                                  Text(
                                    state.place!.address!,
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .025),
                                  SizedBox(
                                    width: size.width,
                                    height: size.width * .5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: GoogleMap(
                                        zoomGesturesEnabled: false,
                                        onMapCreated: (controller) async {
                                          String mapStyle =
                                              await DefaultAssetBundle.of(
                                                      context)
                                                  .loadString(
                                                      "assets/map_style.json");
                                          controller.setMapStyle(mapStyle);
                                        },
                                        markers: {
                                          Marker(
                                              markerId: MarkerId(
                                                LatLng(
                                                  state.place!.latitude!,
                                                  state.place!.longitude!,
                                                ).toString(),
                                              ),
                                              position: LatLng(
                                                state.place!.latitude!,
                                                state.place!.longitude!,
                                              ),
                                              infoWindow: InfoWindow(
                                                title: state.place!.name,
                                                snippet: '',
                                              ))
                                        },
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                            state.place!.latitude!,
                                            state.place!.longitude!,
                                          ),
                                          zoom: 12,
                                        ),
                                        zoomControlsEnabled: false,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.width * .075),
                                  Text(
                                    appLocalizations.nearbyPlaces,
                                    style: AppTextStyles.styleWeight700(
                                      fontSize: size.width * .05,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .025),
                                  _NearbyPlacesList(
                                    size: size,
                                    placeState: state,
                                    placeBloc: placeBloc,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Theme.of(context).primaryColor,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .04,
                                  vertical: size.width * .015),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appLocalizations.contribute,
                                    style: AppTextStyles.styleWeight700(
                                      fontSize: size.width * .05,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .015),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MainButton(
                                        onTap: () {
                                          placeBloc.add(GetVisitTypesEvent());
                                        },
                                        color: Colors.white,
                                        border: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        width: size.width * .35,
                                        height: size.width * .1,
                                        child: Text(
                                          appLocalizations.writeReview,
                                          style: AppTextStyles.styleWeight500(
                                            fontSize: size.width * .0425,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      MainButton(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            constraints: BoxConstraints(
                                                maxHeight: size.width),
                                            builder: (_) =>
                                                UploadImageBottomSheet(
                                              size: size,
                                              onTapUpload: (imageName) {
                                                placeBloc.add(
                                                  UploadImagePlaceEvent(
                                                    id: widget.arg.id,
                                                    imageName: imageName,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        color: Colors.white,
                                        border: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor),
                                        width: size.width * .35,
                                        height: size.width * .1,
                                        child: Text(
                                          appLocalizations.uploadImage,
                                          style: AppTextStyles.styleWeight500(
                                            fontSize: size.width * .0425,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(height: size.width * .025),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * .04,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appLocalizations.review,
                                    style: AppTextStyles.styleWeight700(
                                      fontSize: size.width * .05,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .025),
                                  Row(
                                    children: [
                                      MainRatingBar(
                                        circleSize: size.width * .045,
                                      ),
                                      SizedBox(width: size.width * .025),
                                      Text(
                                        appLocalizations.review,
                                        style: AppTextStyles.styleWeight400(
                                          color: Colors.grey,
                                          fontSize: size.width * .04,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * .025),
                                  ReviewResultCard(size: size),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * .025),
                            Column(
                              children: List.generate(
                                state.reviews.length,
                                (index) => ReviewCard(
                                  size: size,
                                  review: state.reviews[index],
                                ),
                              ),
                            ),
                            SizedBox(height: size.width * .05),
                            Center(
                              child: MainButton(
                                child: Text(
                                  'View All Review',
                                  style: AppTextStyles.styleWeight600(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: size.width * .04),
                                ),
                                color: Colors.white,
                                border: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                                height: size.width * .1,
                                width: size.width * .4,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ReviewsScreen.routeName,
                                    arguments: ReviewsScreenParams(
                                      placeId: widget.arg.id,
                                      name: state.place!.name!,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: size.width * .05),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceScreenParams {
  final String id;

  PlaceScreenParams({required this.id});
}
