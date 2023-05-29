import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../place/presentation/pages/place_screen.dart';
import '../../../search/presentation/pages/search_screen.dart';
import '../bloc/map/map_bloc.dart';
import '../widgets/map_list_image.dart';

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
  late Completer<GoogleMapController> mapController;
  late MapBloc mapBloc;
  @override
  void initState() {
    heightOpen = ValueNotifier(0);
    isExpanded = ValueNotifier(false);
    selectedIndex = ValueNotifier(-1);
    mapController = Completer();
    mapBloc = MapBloc()..add(GetInitLocationEvent());
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
    return BlocProvider(
      create: (context) => mapBloc,
      child: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state.typesToMapStatus == TypesToMapStatus.succ) {
            scrollController.scrollToIndex(
              0,
              preferPosition: AutoScrollPosition.middle,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _MapAppBar(size: size),
            body: Column(
              children: [
                _MapTapBar(
                  size: size,
                  selectedIndex: selectedIndex,
                  scrollController: scrollController,
                  mapBloc: mapBloc,
                  mapState: state,
                ),
                _MapSlider(
                  size: size,
                  mapController: mapController,
                  isExpanded: isExpanded,
                  heightOpen: heightOpen,
                  mapBloc: mapBloc,
                  mapState: state,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
