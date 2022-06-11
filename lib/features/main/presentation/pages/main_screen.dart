import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:trippo/features/map/presentation/pages/map_screen.dart';

import '../../../../core/constants/icons/trippo_icons.dart';
import '../../../../injection.dart';
import '../../../explore/presentation/pages/search_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../plan/presentation/pages/plan_screen.dart';
import '../../../profile/presentation/pages/setting_screen.dart';
import '../bloc/page_manager/page_manager_bloc.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  late PageController controller;
  late PageManagerBloc pageManagerBloc;

  List<Widget> page = [
    const HomeScreen(),
    const ExploreScreen(),
    const MapScreen(),
    // const PlanScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    controller = PageController();
    pageManagerBloc = serviceLocator<PageManagerBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pageManagerBloc,
      child: BlocConsumer<PageManagerBloc, PageManagerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.selectedIndex,
              children: page,
            ),
            bottomNavigationBar: SlidingClippedNavBar(
              barItems: [
                BarItem(
                  title: AppLocalizations.of(context)!.home,
                  icon: TrippoIcons.home,
                ),
                BarItem(
                  title: AppLocalizations.of(context)!.search,
                  icon: TrippoIcons.interface_essential_compass,
                ),
                BarItem(
                  title: AppLocalizations.of(context)!.map,
                  icon: Icons.map,
                ),
                // BarItem(
                //   title: AppLocalizations.of(context)!.plan,
                //   icon: TrippoIcons.favorite_border,
                // ),
                BarItem(
                  title: AppLocalizations.of(context)!.profile,
                  icon: TrippoIcons.profile,
                ),
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedIndex: state.selectedIndex,
              onButtonPressed: (index) {
                pageManagerBloc.add(ChangePageEvent(selectedIndex: index));
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
