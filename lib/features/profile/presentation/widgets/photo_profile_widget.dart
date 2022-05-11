part of '../pages/profile_screen.dart';

class _PhotoProfileWidget extends StatelessWidget {
  const _PhotoProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(size.width * .025),
      crossAxisCount: 3,
      mainAxisSpacing: size.width * .025,
      crossAxisSpacing: size.width * .025,
      itemCount: 5,
      staggeredTileBuilder: (index) {
        return StaggeredTile.extent(
          (index % 4 == 0 || index % 4 == 3) ? 2 : 1,
          size.width * .35,
        );
      },
      itemBuilder: (context, index) {
        return CacheImage(
          key: ValueKey(index),
          imageUrl:
              'https://media.istockphoto.com/photos/old-fortress-of-aleppo-syria-picture-id157533378?k=20&m=157533378&s=612x612&w=0&h=VV2rsmsr4Cu5xSljSf0vl4Y19Ko78gXk-g7jB6koyAg=',
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
                "syria . aleppo",
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
