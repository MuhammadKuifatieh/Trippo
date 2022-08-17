part of '../pages/map_screen.dart';

class _MapTapBar extends StatelessWidget {
  const _MapTapBar({
    Key? key,
    required this.size,
    required this.mapBloc,
    required this.mapState,
    required this.selectedIndex,
    required this.scrollController,
  }) : super(key: key);

  final Size size;
  final MapBloc mapBloc;
  final MapState mapState;
  final ValueNotifier<int> selectedIndex;
  final AutoScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .0725,
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, selectedIndex, _) {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: mapState.types.length,
            itemBuilder: (context, index) {
              return AutoScrollTag(
                key: ValueKey(index),
                controller: scrollController,
                index: index,
                child: GestureDetector(
                  onTap: () {
                    scrollController.scrollToIndex(
                      index,
                      preferPosition: AutoScrollPosition.middle,
                    );
                    this.selectedIndex.value = index;
                    mapBloc.add(ChangeFitterValueEvent(
                      index: index,
                      context: context,
                    ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .025),
                    margin: EdgeInsets.all(size.width * .025),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mapState.typeIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade200,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    // width: size.width * .35,
                    height: size.width * .2,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CacheImage(
                            width: size.width * .1,
                            height: size.width * .1,
                            imageUrl: mapState.types[index].image!.url!,
                            hash: mapState.types[index].image!.hash,
                            shape: BoxShape.circle,
                          ),
                          SizedBox(width: size.width * .01),
                          Text(
                            mapState.types[index].name!,
                            style: AppTextStyles.styleWeight500(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
