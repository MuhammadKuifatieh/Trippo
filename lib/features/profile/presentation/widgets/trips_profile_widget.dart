part of '../pages/profile_screen.dart';

class _TripsProfileWidget extends StatelessWidget {
  const _TripsProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(size.width * .025),
      crossAxisCount: 2,
      mainAxisSpacing: size.width * .025,
      crossAxisSpacing: size.width * .025,
      itemCount: 5,
      staggeredTileBuilder: (index) {
        return StaggeredTile.extent(
          1,
          size.width * .55,
        );
      },
      itemBuilder: (context, index) {
        return CacheImage(
          key: ValueKey(index),
          imageUrl:
              'https://s1.wklcdn.com/image_1/59976/14765799/9181078Master.jpg',
          borderRadius: BorderRadius.circular(10),
          height: size.width * .55,
          width: size.width * .55,
          child: Padding(
            padding: EdgeInsets.all(size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Skeletons of Olmos: ',
                  style: AppTextStyles.styleWeight900(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: size.width * .05,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'October 20 at 10:22 AM',
                  style: AppTextStyles.styleWeight500(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: size.width * .03,
                  ),
                ),
                const Spacer(flex: 2),
                Container(
                  padding: EdgeInsets.all(size.width * .015),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                        size: size.width * .05,
                      ),
                      Text(
                        '1 saves',
                        style: AppTextStyles.styleWeight500(
                          fontSize: size.width * .04,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
