import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/scrolling_list_image.dart';
import '../../../city/presentation/screens/city_screen.dart';
import '../../../explore/presentation/pages/search_screen.dart';
import '../../../place/presentation/pages/place_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../data/models/cities_response.dart';
import '../../data/models/places_response.dart';
import '../bloc/home/home_bloc.dart';

part '../widgets/home_app_bar.dart';
part '../widgets/home_cities.dart';
part '../widgets/home_places.dart';
part '../widgets/home_title_images.dart';
part '../widgets/home_trips.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late SequenceAnimation sequenceAnimation;
  late Size size;
  final PageController pageController = PageController();
  late final HomeBloc homeBloc;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc()..add(const GetHomeInfoEvent());
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    //
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    appLocalizations = AppLocalizations.of(context)!;
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(
            begin: size.width * .1,
            end: size.width * .9,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "width",
          curve: Curves.easeOut,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: size.width * .12,
            end: 0,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "margin",
          curve: Curves.easeOut,
        )
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
            begin: size.width * .175,
            end: size.width * .05,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "startPosition",
          curve: Curves.easeOut,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: size.width * .1,
            end: size.width * .5,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "bottomPosition",
          curve: Curves.easeOut,
        )
        .addAnimatable(
          animatable: BorderRadiusTween(
            begin: BorderRadius.circular(35),
            end: BorderRadius.circular(0),
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "color",
          curve: Curves.easeOut,
        )
        .animate(animationController);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  _HomeAppBar(
                    size: size,
                    animationController: animationController,
                    sequenceAnimation: sequenceAnimation,
                  ),
                ];
              },
              body: ListView(
                padding: EdgeInsetsDirectional.only(
                  start: size.width * .05,
                  top: size.width * .075,
                  bottom: size.width * .1,
                ),
                children: [
                  _HomeTitleImages(size: size),
                  SizedBox(height: size.width * .075),
                  _HomePlaces(
                    size: size,
                    places: state.recentlyViewedPalces,
                    title: appLocalizations.recently_viewed,
                    isFailed: state.recentlyViewedPlacesStatus ==
                        RecentlyViewedPlacesStatus.falied,
                    isLoading: (state.recentlyViewedPlacesStatus ==
                            RecentlyViewedPlacesStatus.loading ||
                        state.recentlyViewedPlacesStatus ==
                            RecentlyViewedPlacesStatus.init),
                    onTapRety: () {
                      homeBloc.add(const GetRecentlyViewedPlacesEvent());
                    },
                  ),
                  SizedBox(height: size.width * .075),
                  _HomeCities(
                    title: appLocalizations.trendingCitiesTitle,
                    descreption: appLocalizations.trendingCitiesDescreption,
                    size: size,
                    cities: state.trendingCities,
                    isLoading: (state.trendingCitiesStatus ==
                            TrendingCitiesStatus.loading ||
                        state.trendingCitiesStatus ==
                            TrendingCitiesStatus.init),
                    isFalied: state.trendingCitiesStatus ==
                        TrendingCitiesStatus.falied,
                    onTapRety: () {
                      homeBloc.add(const GetTrendingCitiesEvent());
                    },
                  ),
                  SizedBox(height: size.width * .075),
                  _HomePlaces(
                    size: size,
                    places: state.topAttractionPlaces,
                    title: appLocalizations.topAttraction,
                    description: appLocalizations.mostPopularPlaceToVisit,
                    isFailed: state.topAttractionPlacesStatus ==
                        TopAttractionPlacesStatus.falied,
                    isLoading: (state.topAttractionPlacesStatus ==
                            TopAttractionPlacesStatus.loading ||
                        state.topAttractionPlacesStatus ==
                            TopAttractionPlacesStatus.init),
                    onTapRety: () {
                      homeBloc.add(const GetTopAttractionPlacesEvent());
                    },
                  ),
                  SizedBox(height: size.width * .075),
                  Text(
                    appLocalizations.descoverSomeExperince,
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .06,
                    ),
                  ),
                  Text(
                    appLocalizations.thingToDoOnYourTrip,
                    style: AppTextStyles.styleWeight400(
                      fontSize: size.width * .04,
                    ),
                  ),
                  SizedBox(height: size.width * .025),
                  _HomeTrips(size: size),
                  SizedBox(height: size.width * .075),
                  SizedBox(height: size.width * .025),
                  _HomePlaces(
                    title: appLocalizations.smallBatchStays,
                    description: appLocalizations.coolCities,
                    size: size,
                    places: state.smallBatchPlaces,
                    isFailed: state.smallBatchPlacesStatus ==
                        SmallBatchPlacesStatus.falied,
                    isLoading: (state.smallBatchPlacesStatus ==
                            SmallBatchPlacesStatus.loading ||
                        state.smallBatchPlacesStatus ==
                            SmallBatchPlacesStatus.init),
                    onTapRety: () {
                      homeBloc.add(const GetSmallBatchPlacesEvent());
                    },
                  ),
                  SizedBox(height: size.width * .075),
                  _HomePlaces(
                    title: appLocalizations.youMightLikeThis,
                    description: appLocalizations.mostPopularPlaceToVisit,
                    size: size,
                    places: state.mightLikePlaces,
                    isFailed: state.mightLikePlacesStatus ==
                        MightLikePlacesStatus.falied,
                    isLoading: (state.mightLikePlacesStatus ==
                            MightLikePlacesStatus.loading ||
                        state.mightLikePlacesStatus ==
                            MightLikePlacesStatus.init),
                    onTapRety: () {
                      homeBloc.add(const GetMightLikePlacesEvent());
                    },
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
