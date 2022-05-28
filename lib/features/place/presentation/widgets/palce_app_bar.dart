part of '../pages/place_screen.dart';

class _PlaceAppBar extends StatelessWidget {
  const _PlaceAppBar({
    Key? key,
    required this.size,
    required this.animationController,
    required this.sequenceAnimation,
    required this.pageController,
    required this.indexValue,
  }) : super(key: key);

  final Size size;
  final AnimationController animationController;
  final SequenceAnimation sequenceAnimation;
  final PageController pageController;
  final ValueNotifier<int> indexValue;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                  Navigator.of(context).pop();
                },
                width: size.width * .1,
                height: size.width * .1,
                color: Colors.white
                    .withOpacity(sequenceAnimation['opacity'].value),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: size.width * .065,
                  color: Theme.of(context).primaryColor,
                ),
              );
            }),
      ),
      title: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return AnimatedDefaultTextStyle(
            child: const Text('Very Beutiful Home'),
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
          if ((boxConstraints.maxHeight - MediaQuery.of(context).padding.top) <
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
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(ImagesScreen.routeName);
                                  },
                                  child: CacheImage(
                                    width: size.width,
                                    height: size.width * .6666,
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1612151855475-877969f4a6cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&w=1000&q=80',
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
                                        '$value/+999',
                                        style: AppTextStyles.styleWeight400(
                                          color: Theme.of(context).primaryColor,
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
                      Icons.share_outlined,
                      size: size.width * .065,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: size.width * .05),
                  MainButton(
                    onTap: () {},
                    width: size.width * .1,
                    height: size.width * .1,
                    color: Colors.white
                        .withOpacity(sequenceAnimation['opacity'].value),
                    child: Icon(
                      Icons.favorite_border,
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

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.onTap,
    this.color,
    this.border,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double width;
  final double height;
  final BorderSide? border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: border ?? BorderSide.none,
            ),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
