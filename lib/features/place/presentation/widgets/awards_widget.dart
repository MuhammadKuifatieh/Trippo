part of '../pages/place_screen.dart';

class _AwardsWidget extends StatelessWidget {
  const _AwardsWidget({
    Key? key,
    required this.appLocalizations,
    required this.awards,
    required this.size,
  }) : super(key: key);

  final AppLocalizations appLocalizations;
  final Size size;
  final List<AwardModel> awards;

  @override
  Widget build(BuildContext context) {
    return (awards.isEmpty)
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.awards,
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .05,
                ),
              ),
              SizedBox(
                height: size.width * 0.25,
                child: ListView.builder(
                  itemCount: awards.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Row(
                    children: [
                      CacheImage(
                        width: size.width * 0.15,
                        height: size.width * 0.15,
                        imageUrl: awards[index].image!.url!,
                        hash: awards[index].image!.hash,
                        shape: BoxShape.circle,
                      ),
                      SizedBox(width: size.width * .025),
                      SizedBox(
                        width: size.width * .35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              awards[index].name!,
                              style: AppTextStyles.styleWeight500(
                                fontSize: size.width * .04,
                              ),
                            ),
                            SizedBox(height: size.width * .01),
                            Text(
                              awards[index].donor!,
                              style: AppTextStyles.styleWeight400(
                                fontSize: size.width * .04,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width * .04),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
            ],
          );
  }
}
