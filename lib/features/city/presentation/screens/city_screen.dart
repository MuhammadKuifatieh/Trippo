import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/main_indicator.dart';
import 'package:trippo/features/city/presentation/widgets/overview_page.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                sliver: SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  leading: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AssetSvg(SvgImages.arrowBackward),
                  ),
                  centerTitle: true,
                  title: Text(
                    'City Name',
                    style: AppTextStyles.styleWeight500(
                      color: Colors.black,
                      fontSize: 14,
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
                      indicatorColor: Colors.black,
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
                    labelStyle: AppTextStyles.styleWeight600(fontSize: 14),
                    unselectedLabelStyle:
                        AppTextStyles.styleWeight400(fontSize: 14),
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    tabs: [
                      Text(
                        'Overview',
                        style: AppTextStyles.styleWeight500(fontSize: 16),
                      ),
                      Text(
                        'Hotels',
                        style: AppTextStyles.styleWeight500(fontSize: 16),
                      ),
                      Text(
                        'Things to do',
                        style: AppTextStyles.styleWeight500(fontSize: 16),
                      ),
                      Text(
                        'Restaurants',
                        style: AppTextStyles.styleWeight500(fontSize: 16),
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
            OverviewPage(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
