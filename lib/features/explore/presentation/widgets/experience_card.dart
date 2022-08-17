part of '../pages/experiences_screen.dart';

class _ExperienceCard extends StatefulWidget {
  const _ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);
  final ExperienceModel experience;

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  late final Size size;
  ValueNotifier<int> index = ValueNotifier(0);
  changeIndex() {
    Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      index.value = (index.value != 2) ? index.value + 1 : 0;
    });
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    changeIndex();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (context, indexValue, _) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ExperiencesDetailesScreen.routeName,
                arguments: ExperiencesDetailesScreenParams(
                  id: widget.experience.id.toString(),
                  name: widget.experience.name!,
                ),
              );
            },
            child: Stack(
              children: [
                AnimatedSwitcher(
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      child: child,
                      opacity: animation,
                      alwaysIncludeSemantics: true,
                    );
                  },
                  duration: const Duration(milliseconds: 500),
                  child: CacheImage(
                    key: Key(indexValue.toString()),
                    width: size.width,
                    height: size.height,
                    imageUrl: widget.experience.images![indexValue].url!,
                    hash: widget.experience.images![indexValue].hash,
                  ),
                ),
                PositionedDirectional(
                  bottom: size.width * .025,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: size.width * .02),
                        SizedBox(
                          width: size.width * .65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.experience.name!,
                                style: AppTextStyles.styleWeight700(
                                  color: Colors.white,
                                  fontSize: size.width * .05,
                                ),
                              ),
                              Text(
                                widget.experience.about!,
                                style: AppTextStyles.styleWeight400(
                                  color: Colors.white,
                                  fontSize: size.width * .05,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'From ${widget.experience.priceBegin}\$ /preson',
                                style: AppTextStyles.styleWeight400(
                                  color: Colors.white,
                                  fontSize: size.width * .05,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CacheImage(
                          imageUrl: widget.experience.user?.image?.url ??
                              'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg',
                          height: size.width * .2,
                          width: size.width * .2,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
