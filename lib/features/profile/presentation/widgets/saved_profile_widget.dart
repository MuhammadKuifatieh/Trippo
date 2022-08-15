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
          return Container(
            margin: EdgeInsets.all(size.width * .025),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                CacheImage(
                  imageUrl: widget.state.favoritePlaces[index].images![0].url!,
                  hash: widget.state.favoritePlaces[index].images![index].hash,
                  width: size.width * .4,
                  height: size.width * .4,
                  borderRadius: const BorderRadiusDirectional.horizontal(
                    start: Radius.circular(15),
                  ),
                ),
                SizedBox(
                  width: size.width * .025,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.state.favoritePlaces[index].name!,
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: Text(
                        widget.state.favoritePlaces[index].about!,
                        style: AppTextStyles.styleWeight600(
                          fontSize: size.width * .04,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: size.width * .05),
                    Row(
                      children: [
                        MainRatingBar(
                          isFiter: true,
                          filterRating: double.parse(widget
                              .state.favoritePlaces[index].ratting
                              .toString()),
                        ),
                        SizedBox(width: size.width * .02),
                        Text(
                          widget.state.favoritePlaces[index].rattingCount
                              .toString(),
                          style: AppTextStyles.styleWeight600(
                            color: Colors.grey,
                            fontSize: size.width * .0275,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.state.favoritePlaces[index].cityName!,
                              style: AppTextStyles.styleWeight400(
                                fontSize: size.width * .035,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            width: size.width * .2,
                            height: size.width * .06,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 1.5,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                widget.state.favoritePlaces[index].typeName!,
                                style: AppTextStyles.styleWeight600(
                                  fontSize: size.width * .025,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
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
