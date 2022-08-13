part of '../pages/home_screen.dart';

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    Key? key,
    required this.size,
    required this.animationController,
    required this.sequenceAnimation,
  }) : super(key: key);

  final Size size;
  final AnimationController animationController;
  final SequenceAnimation sequenceAnimation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2,
      floating: false,
      pinned: true,
      snap: false,
      forceElevated: false,
      expandedHeight: size.width * .6,
      collapsedHeight: size.width * .15,
      toolbarHeight: size.width * .15,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, boxConstraints) {
          if ((boxConstraints.maxHeight - MediaQuery.of(context).padding.top) <
              size.width * .3) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Stack(
                children: [
                  CacheImage(
                    width: size.width,
                    height: size.width * .7,
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        1 - (sequenceAnimation['isOpen'].value) as double,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: size.width * .025,
                    top: size.width * .125,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ProfileScreen.routeName);
                      },
                      child: CacheImage(
                        imageUrl:
                            'https://media-exp1.licdn.com/dms/image/C4E03AQEIZ8ds-8dtrw/profile-displayphoto-shrink_200_200/0/1623533074857?e=2147483647&v=beta&t=eFYm5aiC21gAVTXcQL-ZAxdhoo1AHFBt8IBUvnbmiUo',
                        height: size.width * .1,
                        width: size.width * .1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: size.width * .035,
                    top: size.width * .135,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: AppTextStyles.styleWeight700(
                          color: sequenceAnimation['isOpen'].value == 1
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontSize: size.width * .06),
                      child: Text(
                        AppLocalizations.of(context)!.home,
                      ),
                    ),
                  ),
                  AnimatedPositionedDirectional(
                    duration: const Duration(milliseconds: 125),
                    bottom: size.width * .02,
                    end: sequenceAnimation['startPosition'].value,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SearchScreen.routeName);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: sequenceAnimation['isOpen'].value == 1
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            width: .5,
                          ),
                          borderRadius: sequenceAnimation['isOpen'].value > .5
                              ? BorderRadius.circular(25)
                              : BorderRadius.circular(100000000),
                          color: Colors.white,
                        ),
                        width: sequenceAnimation['width'].value,
                        height: sequenceAnimation['isOpen'].value == 1
                            ? size.width * .12
                            : size.width * .1,
                        padding: sequenceAnimation['isOpen'].value == 1
                            ? EdgeInsets.all(size.width * .025)
                            : EdgeInsets.zero,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (sequenceAnimation['isOpen'].value == 1)
                                const Spacer(flex: 1),
                              Icon(
                                TrippoIcons.search,
                                color: Theme.of(context).primaryColor,
                                size: size.width * .055,
                              ),
                              if (sequenceAnimation['isOpen'].value == 1) ...[
                                const Spacer(flex: 1),
                                Text(
                                  AppLocalizations.of(context)!.whereGoing,
                                  style: AppTextStyles.styleWeight500(
                                    fontSize: size.width * .035,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                const Spacer(flex: 8),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
