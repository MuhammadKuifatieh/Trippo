part of '../pages/map_screen.dart';

class _MapTapBar extends StatelessWidget {
  const _MapTapBar({
    Key? key,
    required this.size,
    required this.selectedIndex,
    required this.scrollController,
  }) : super(key: key);

  final Size size;
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
            itemCount: 10,
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
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .025),
                    margin: EdgeInsets.all(size.width * .025),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
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
                          const Icon(Icons.home_outlined),
                          SizedBox(width: size.width * .01),
                          Text(
                            "Hotel",
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
