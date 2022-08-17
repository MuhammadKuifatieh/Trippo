import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/place/presentation/widgets/plan_card.dart';

import '../../../../core/widgets/loading_screen.dart';
import '../blocs/city/city_bloc.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({
    Key? key,
    required this.cityId,
  }) : super(key: key);
  final int cityId;

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late final ScrollController _scrollController;
  late final CityBloc cityBloc;
  late Size size;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    cityBloc = CityBloc();
    cityBloc.add(PublicPlansFetched(widget.cityId));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      bloc: cityBloc,
      builder: (context, state) {
        if (state.fetchingStatus == FetchingStatus.initial) {
          return const LoadingScreen();
        } else if (state.fetchingStatus == FetchingStatus.failure) {
          return MainErrorWidget(
            size: size,
            onTapRety: () {
              cityBloc.add(PublicPlansFetched(widget.cityId));
            },
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index == state.plans.length) {
              return const LoadingScreen();
            }
            return PlanCard(
              plan: state.plans[index],
            );
          },
          itemCount:
              state.hasReachedMax ? state.plans.length : state.plans.length + 1,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          controller: _scrollController,
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      cityBloc.add(PublicPlansFetched(widget.cityId));
    }
  }
}
