import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/place/presentation/widgets/plan_card.dart';
import 'package:trippo/features/profile/presentation/widgets/small_place_card.dart';

import '../../../../core/widgets/loading_screen.dart';
import '../blocs/city/city_bloc.dart';

class ThingsPage extends StatefulWidget {
  const ThingsPage({
    Key? key,
    required this.cityId,
  }) : super(key: key);
  final int cityId;

  @override
  State<ThingsPage> createState() => _ThingsPageState();
}

class _ThingsPageState extends State<ThingsPage> {
  late final ScrollController _scrollController;
  late final CityBloc cityBloc;
  late Size size;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    cityBloc = CityBloc();
    cityBloc.add(AnyPlacesFetched(cityId: widget.cityId, typeId: 2));
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
              cityBloc.add(AnyPlacesFetched(cityId: widget.cityId, typeId: 2));
            },
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index == state.places.length) {
              return const LoadingScreen();
            }
            return SmallPlaceCard(place: state.places[index], size: size);
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
