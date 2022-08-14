import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/city/presentation/bloc/city_bloc.dart';
import 'package:trippo/injection.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/main_indicator.dart';
import '../widgets/overview_page.dart';

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
    tabController = TabController(length: 4, vsync: this);
    cityBloc = CityBloc(
        getPlacesOfCityUseCase: serviceLocator(),
        getCityByIdUseCase: serviceLocator())
      ..add(GetCityEvent(cityId: widget.cityId!))
      ..add(GetPlacesOfCityEvent(cityId: widget.cityId!));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => cityBloc,
      child: Scaffold(
        body: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            if (state.cityStatus == GetCityStatus.loading ||
                state.cityStatus == GetCityStatus.initial) {
              return const LoadingScreen();
            } else if (state.cityStatus == GetCityStatus.failure) {
              MainErrorWidget(
                  size: size,
                  onTapRety: () {
                    cityBloc
                      ..add(GetCityEvent(cityId: widget.cityId!))
                      ..add(GetPlacesOfCityEvent(cityId: widget.cityId!));
                  });
              return Container();
            } else {
              return SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, _) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverSafeArea(
                          sliver: SliverAppBar(
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
                                'حلب',
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
                                indicatorColor: Theme.of(context).primaryColor,
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
                              tabs: const [
                                Text(
                                  'نظرة عامة',
                                ),
                                Text(
                                  'اماكن للزيارة',
                                ),
                                Text(
                                  'أنشطة للقيام بها',
                                ),
                                Text(
                                  'مطاعم',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: [
                      OverviewPage(tabController: tabController),
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: size.width * .6,
                            width: size.width * .9,
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: size.width * .6,
                            width: size.width * .9,
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: size.width * .6,
                            width: size.width * .9,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
