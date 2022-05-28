import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:trippo/core/widgets/place_tile.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/scrolling_list_image.dart';

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
  late final SequenceAnimation sequenceAnimation;
  late final Size size;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    //
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
            Text(
              'Recently viewed',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomePlaces(
              size: size,
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoxsa6Bi3ZEuSNlEpOJv9nu_HRNqCKMUAoGxasmY1kuvbmIgKy6csAGQ2Hfolit1f4LQs&usqp=CAU',
            ),
            SizedBox(height: size.width * .075),
            Text(
              'Inspiration for your next Trip',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            Text(
              'Family-friendly spots to explore',
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomeCities(
              size: size,
              imageUrl:
                  'https://i.pinimg.com/originals/9b/c6/9e/9bc69e93317d5ee90e13c546d82d88d9.png',
            ),
            SizedBox(height: size.width * .075),
            Text(
              'Top Attraction',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            Text(
              'Most popular palce to visit',
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomePlaces(
              size: size,
              imageUrl:
                  'https://media.istockphoto.com/photos/patan-picture-id637696304?s=170667a',
            ),
            SizedBox(height: size.width * .075),
            Text(
              'Descover some experince',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            Text(
              'Thing to do on your trip',
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomeTrips(size: size),
            SizedBox(height: size.width * .075),
            Text(
              'Small Batch Stays',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            Text(
              'Cool citites, cooler boutique hotels',
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomeCities(
              size: size,
              imageUrl:
                  'https://assets.theedgemarkets.com/CC4_KuchingProperty_TEM1378_theedgemarkets.jpg?pWlPSDFjTim1RExRLlJcJimJj8KabIn_',
            ),
            SizedBox(height: size.width * .075),
            Text(
              'You might like This',
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .06,
              ),
            ),
            Text(
              'More places to explore in damascus',
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .025),
            _HomePlaces(
              size: size,
              imageUrl: 'https://theinpaint.com/images/example-1-1.jpg',
            )
          ],
        ),
      ),
    );
  }
}
