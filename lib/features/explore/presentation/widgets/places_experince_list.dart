part of '../pages/experiences_detailes_screen.dart';

class _PlacesExperinceList extends StatelessWidget {
  const _PlacesExperinceList({
    Key? key,
    required this.size,
    required this.experinceDetailesBloc,
    required this.experinceDetailesState,
  }) : super(key: key);

  final Size size;
  final ExperinceDetailesBloc experinceDetailesBloc;
  final ExperinceDetailesState experinceDetailesState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .65,
      child: GridView.builder(
        itemCount: experinceDetailesState.experience!.places!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .5,
          mainAxisSpacing: size.width * .05,
          crossAxisSpacing: size.width * .05,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              PlaceScreen.routeName,
              arguments: PlaceScreenParams(
                id: experinceDetailesState.experience!.places![index].id
                    .toString(),
              ),
            );
          },
          child: Row(
            children: [
              CacheImage(
                width: size.width * .3,
                height: size.width * .3,
                borderRadius: BorderRadius.circular(15),
                imageUrl: experinceDetailesState.experience!.places![index].images![0].url!,
                hash: experinceDetailesState.experience!.places![index].images![0].hash,
              ),
              SizedBox(width: size.width * .02),
              SizedBox(
                width: size.width * .275,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.width * .025),
                    Text(
                      experinceDetailesState.experience!.places![index].name!,
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: size.width * .025),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MainRatingBar(
                          isFiter: true,
                          filterRating: double.parse(experinceDetailesState
                              .places[index].ratting
                              .toString()),
                        ),
                        Text(
                          experinceDetailesState.experience!.places![index].rattingCount
                              .toString(),
                          style: AppTextStyles.styleWeight400(
                            fontSize: size.width * .035,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.width * .025),
                    Flexible(
                      child: Text(
                        experinceDetailesState.experience!.places![index].about!,
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .035,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
