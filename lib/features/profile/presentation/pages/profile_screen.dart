import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/hero_tag.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_indicator.dart';
import '../../../../core/widgets/main_rating_bar.dart';

part '../widgets/photo_profile_widget.dart';
part '../widgets/profile_sliver_app_bar.dart';
part '../widgets/profile_sliver_app_bar_delegate.dart';
part '../widgets/saved_profile_widget.dart';
part '../widgets/trips_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profileSceen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late SequenceAnimation sequenceAnimation;
  late Size size;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    tabController = TabController(length: 3, vsync: this);
    //
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(
            begin: size.width * .15,
            end: 1000,
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
            begin: size.width * .3,
            end: size.width * .05,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "startPosition",
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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return <Widget>[
            _ProfileSliverAppBar(
              animationController: animationController,
              sequenceAnimation: sequenceAnimation,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                size: size,
                tabController: tabController,
              ),
            ),
          ];
        },
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  _PhotoProfileWidget(),
                  _TripsProfileWidget(),
                  _SavedProfileWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
