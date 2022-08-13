part of '../pages/profile_screen.dart';

class _PhotoProfileWidget extends StatelessWidget {
  const _PhotoProfileWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(size.width * .025),
      crossAxisCount: 3,
      mainAxisSpacing: size.width * .025,
      crossAxisSpacing: size.width * .025,
      itemCount: state.trendingCities.length,
      staggeredTileBuilder: (index) {
        return StaggeredTile.extent(
          (index % 4 == 0 || index % 4 == 3) ? 2 : 1,
          size.width * .35,
        );
      },
      itemBuilder: (context, index) {
        return CacheImage(
          key: ValueKey(index),
          imageUrl: state.trendingCities[index].images![0].url!,
          width: (index % 4 == 0 || index % 4 == 3)
              ? size.width * .7
              : size.width * .35,
          height: size.width * .35,
          borderRadius: BorderRadius.circular(10),
          child: Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.all(size.width * .025),
              child: Text(
                state.trendingCities[index].name!,
                style: AppTextStyles.styleWeight300(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: size.width * .035,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
