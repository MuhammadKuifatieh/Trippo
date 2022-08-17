part of '../pages/profile_screen.dart';

class _ProfileSliverAppBar extends StatelessWidget {
  const _ProfileSliverAppBar({
    Key? key,
    required this.sequenceAnimation,
    required this.animationController,
  }) : super(key: key);
  final SequenceAnimation sequenceAnimation;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      elevation: 2,
      floating: false,
      pinned: true,
      snap: false,
      forceElevated: false,
      expandedHeight: size.width * .6,
      toolbarHeight: size.width * .2,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, boxConstraints) {
          if ((boxConstraints.maxHeight - MediaQuery.of(context).padding.top) <
              size.width * .25) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Stack(
                children: [
                  Hero(
                    tag: HeroTag.imageProfile,
                    child: CachedNetworkImage(
                      imageUrl: GlobalFunctions.getUserInfo()!.image?.url ??
                          'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg',
                      imageBuilder: (context, imageProvider) =>
                          AnimatedContainer(
                        duration: const Duration(milliseconds: 50),
                        margin: EdgeInsetsDirectional.only(
                          start: sequenceAnimation['margin'].value,
                          top: sequenceAnimation['margin'].value,
                        ),
                        // color: sequenceAnimation['color'].value,
                        height: sequenceAnimation['width'].value,
                        width: sequenceAnimation['width'].value,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: sequenceAnimation['color'].value,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            isAntiAlias: true,
                          ),
                        ),
                        child: Container(
                          decoration: sequenceAnimation['isOpen'].value == 1
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.white.withOpacity(.25),
                                    ],
                                    begin: AlignmentDirectional.topCenter,
                                    end: AlignmentDirectional.bottomCenter,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositionedDirectional(
                    duration: const Duration(milliseconds: 125),
                    bottom: size.width * .02,
                    start: sequenceAnimation['startPosition'].value,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 50),
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GlobalFunctions.getUserInfo()!.firstName! +
                                " " +
                                GlobalFunctions.getUserInfo()!.lastName!,
                            style: AppTextStyles.styleWeight500(
                              color: Colors.black,
                              fontSize: size.width * .04,
                            ),
                          ),
                          Text(
                            GlobalFunctions.getUserInfo()!.about ?? "",
                            style: AppTextStyles.styleWeight400(
                              color: Colors.grey.shade400,
                            ).copyWith(
                              overflow: TextOverflow.ellipsis,
                              height: 1.5,
                            ),
                            maxLines: sequenceAnimation['isOpen'].value == 1
                                ? null
                                : 1,
                          ),
                        ],
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
