part of '../pages/place_screen.dart';

class _PlaceAppBar extends StatelessWidget {
  const _PlaceAppBar({
    Key? key,
    required this.size,
    required this.animationController,
    required this.sequenceAnimation,
    required this.pageController,
    required this.indexValue,
    required this.images,
    required this.title,
    required this.onTapFavorite,
    required this.isFavorite,
    required this.onTapPop,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final AnimationController animationController;
  final SequenceAnimation sequenceAnimation;
  final PageController pageController;
  final ValueNotifier<int> indexValue;
  final List<ImageModel> images;
  final String title;
  final VoidCallback onTapFavorite;
  final bool? isFavorite;
  final VoidCallback onTap;
  final VoidCallback onTapPop;

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? SliverAppBar(
            elevation: 5,
            floating: false,
            pinned: true,
            snap: false,
            forceElevated: false,
            expandedHeight: size.width * .575,
            collapsedHeight: size.width * .15,
            toolbarHeight: size.width * .15,
            flexibleSpace: Shimmer.fromColors(
              child: Container(
                  width: size.width,
                  height: size.width * .6666,
                  color: Colors.grey),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade400,
            ),
          )
        : SliverAppBar(
            elevation: 5,
            floating: false,
            pinned: true,
            snap: false,
            forceElevated: false,
            expandedHeight: size.width * .575,
            collapsedHeight: size.width * .15,
            toolbarHeight: size.width * .15,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(
                start: size.width * .04,
                top: size.width * .025,
                bottom: size.width * .025,
              ),
              child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return MainButton(
                      onTap: () {
                        onTapPop();
                      },
                      width: size.width * .1,
                      height: size.width * .1,
                      color: Colors.white
                          .withOpacity(sequenceAnimation['opacity'].value),
                      child: Center(
                        child: Icon(
                          !GlobalFunctions().isRTLDirectionality(context)
                              ? Icons.keyboard_arrow_left_rounded
                              : Icons.keyboard_arrow_right_rounded,
                          size: size.width * .1,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }),
            ),
            title: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return AnimatedDefaultTextStyle(
                  child: Text(title),
                  style: AppTextStyles.styleWeight700(
                    color: sequenceAnimation['isOpen'].value == 1
                        ? Colors.transparent
                        : Theme.of(context).primaryColor,
                    fontSize: size.width * .05,
                  ),
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
            flexibleSpace: LayoutBuilder(
              builder: (context, boxConstraints) {
                if ((boxConstraints.maxHeight -
                        MediaQuery.of(context).padding.top) <
                    size.width * .175) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
                return AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: sequenceAnimation['isOpen'].value == 1
                            ? Stack(
                                children: [
                                  PageView.builder(
                                    controller: pageController,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: onTap,
                                        child: CacheImage(
                                          width: size.width,
                                          height: size.width * .6666,
                                          imageUrl: images[index].url!,
                                          hash: images[index].hash,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  PositionedDirectional(
                                    bottom: size.width * .02,
                                    end: size.width * .01,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * .02,
                                        vertical: size.width * .01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: ValueListenableBuilder<int>(
                                          valueListenable: indexValue,
                                          builder: (context, value, _) {
                                            return Text(
                                              '$value/${images.length}',
                                              style:
                                                  AppTextStyles.styleWeight400(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                ],
                              )
                            : Container(),
                      );
                    });
              },
            ),
            actions: [
              AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Row(
                      children: [
                        MainButton(
                          onTap: () {},
                          width: size.width * .1,
                          height: size.width * .1,
                          color: Colors.white.withOpacity(
                            sequenceAnimation['opacity'].value,
                          ),
                          child: Icon(
                            Icons.bookmark_add_sharp,
                            size: size.width * .065,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(width: size.width * .05),
                        MainButton(
                          onTap: onTapFavorite,
                          width: size.width * .1,
                          height: size.width * .1,
                          color: Colors.white
                              .withOpacity(sequenceAnimation['opacity'].value),
                          child: Icon(
                            isFavorite ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: size.width * .065,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                        SizedBox(width: size.width * .05),
                      ],
                    );
                  }),
            ],
          );
  }
}
