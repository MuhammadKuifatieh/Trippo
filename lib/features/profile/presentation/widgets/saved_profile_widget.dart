part of '../pages/profile_screen.dart';

class _SavedProfileWidget extends StatefulWidget {
  const _SavedProfileWidget({
    Key? key,
    required this.state,
    required this.profileBloc,
  }) : super(key: key);
  final ProfileState state;
  final ProfileBloc profileBloc;

  @override
  State<_SavedProfileWidget> createState() => _SavedProfileWidgetState();
}

class _SavedProfileWidgetState extends State<_SavedProfileWidget> {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        widget.profileBloc.add(
          GetFavoritePlacesEvent(
            isReload: true,
          ),
        );
      },
      child: ListView.builder(
        itemCount: widget.state.favoritePlaces.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return SmallPlaceCard(
            place: widget.state.favoritePlaces[index],
            size: size,
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      widget.profileBloc.add(GetFavoritePlacesEvent());
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
