import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../../../core/widget/trippo_icons_icons.dart';
import '../../../explore/presentation/pages/explore_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../plan/presentation/pages/plan_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
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
  List<Widget> page = [
    const HomeScreen(),
    const ExploreScreen(),
    const PlanScreen(),
    const ProfileScreenn(),
  ];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageManagerBloc(),
      child: BlocConsumer<PageManagerBloc, PageManagerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: page[state.selectedIndex],
            bottomNavigationBar: SlidingClippedNavBar(
              barItems: [
                BarItem(
                  title: 'Home',
                  icon: TrippoIcons.home,
                ),
                BarItem(
                  title: 'Explore',
                  icon: TrippoIcons.interface_essential_compass,
                ),
                BarItem(
                  title: 'Plan',
                  icon: TrippoIcons.favorite_border,
                ),
                BarItem(
                  title: 'Profile',
                  icon: TrippoIcons.profile,
                ),
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedIndex: state.selectedIndex,
              onButtonPressed: (index) {
                context
                    .read<PageManagerBloc>()
                    .add(ChangePageEvent(selectedIndex: index));
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
