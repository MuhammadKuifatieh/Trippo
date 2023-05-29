import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/hotels_page.dart';
import 'package:trippo/features/city/presentation/widgets/plans_page.dart';
import 'package:trippo/features/city/presentation/widgets/things_page.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/main_indicator.dart';
import '../blocs/city/city_bloc.dart';
import '../widgets/overview_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/resturants_page.dart';

class CityScreen extends StatefulWidget {
  static const String routeName = 'city_screen';
  const CityScreen({Key? key, this.cityId}) : super(key: key);
  final int? cityId;
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late CityBloc cityBloc;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    cityBloc = CityBloc();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => cityBloc,
      child: Scaffold(
        body: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state.questionAddingStatus == QuestionAddingStatus.loading) {
              BotToast.showLoading();
            } else if (state.questionAddingStatus ==
                QuestionAddingStatus.failure) {
              BotToast.closeAllLoading();
              BotToast.showText(text: appLocalizations.questionFail);
            } else if (state.questionAddingStatus ==
                QuestionAddingStatus.success) {
              BotToast.closeAllLoading();
              BotToast.showText(text: appLocalizations.questionSucc);
            }
          },
          child: BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, _) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverSafeArea(
                          sliver: Directionality(
                            textDirection: TextDirection.ltr,
                            child: SliverAppBar(
                              pinned: true,
                              floating: true,
                              snap: true,
                              foregroundColor: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              elevation: 0,
                              leading: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: AssetSvg(
                                  SvgImages.arrowBackward,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              flexibleSpace: FlexibleSpaceBar(
                                titlePadding:
                                    EdgeInsets.only(bottom: size.width * .15),
                                centerTitle: true,
                                title: Text(
                                  state.city.name ?? "City Name",
                                  style: AppTextStyles.styleWeight600(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                  ).copyWith(height: 1),
                                ),
                              ),
                              actions: const [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(end: 8),
                                  child: Icon(Icons.search),
                                )
                              ],
                              bottom: TabBar(
                                controller: tabController,
                                isScrollable: true,
                                indicator: MainIndicator(
                                  indicatorHeight: size.width * .007,
                                  indicatorColor:
                                      Theme.of(context).primaryColor,
                                  indicatorSize: MainIndicatorSize.normal,
                                ),
                                indicatorPadding: EdgeInsetsDirectional.only(
                                  end: size.width * .05,
                                  bottom: 4,
                                ),
                                labelPadding: EdgeInsetsDirectional.only(
                                  top: size.width * .025,
                                  bottom: size.width * .035,
                                  end: size.width * .06,
                                ),
                                labelStyle: AppTextStyles.styleWeight600(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                                unselectedLabelStyle:
                                    AppTextStyles.styleWeight400(fontSize: 16),
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .05),
                                unselectedLabelColor:
                                    Theme.of(context).primaryColor,
                                labelColor: Theme.of(context).primaryColor,
                                tabs: [
                                  Text(
                                    appLocalizations.overview,
                                  ),
                                  Text(
                                    appLocalizations.placesToVisit,
                                  ),
                                  Text(
                                    appLocalizations.thingsToDo,
                                  ),
                                  Text(
                                    appLocalizations.restaurants,
                                  ),
                                  Text(
                                    appLocalizations.plans,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: [
                      OverviewPage(
                        tabController: tabController,
                        cityId: widget.cityId!,
                      ),
                      HotelsPage(cityId: widget.cityId!),
                      ThingsPage(cityId: widget.cityId!),
                      ResturantsPage(cityId: widget.cityId!),
                      PlansPage(cityId: widget.cityId!),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
