import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:trippo/features/map/presentation/widgets/map_list_image.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/scrolling_list_image.dart';

part '../widgets/map_app_bar.dart';
part '../widgets/map_slider.dart';
part '../widgets/map_tap_bar.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = 'mapScreen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Size size;
  late ValueNotifier<bool> isExpanded;
  late PageController pageController;
  late ValueNotifier<int> selectedIndex;
  late ValueNotifier<double> heightOpen;
  late AutoScrollController scrollController;

  @override
  void initState() {
    heightOpen = ValueNotifier(0);
    isExpanded = ValueNotifier(false);
    selectedIndex = ValueNotifier(-1);

    pageController = PageController();
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MapAppBar(size: size),
      body: Column(
        children: [
          _MapTapBar(
            size: size,
            selectedIndex: selectedIndex,
            scrollController: scrollController,
          ),
          _MapSlider(
            size: size,
            isExpanded: isExpanded,
            heightOpen: heightOpen,
          ),
        ],
      ),
    );
  }
}
