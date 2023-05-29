part of '../pages/profile_screen.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverAppBarDelegate({
    required this.size,
    required this.tabController,
  });
  final Size size;
  final TabController tabController;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Container(
          //   height: size.width * .175,
          //   decoration: BoxDecoration(
          //     border: Border.symmetric(
          //       horizontal: BorderSide(
          //         color: Colors.grey.shade100,
          //         width: 2,
          //       ),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Text(
          //             '438',
          //             style: AppTextStyles.styleWeight500(
          //               fontSize: size.width * .05,
          //             ),
          //           ),
          //           Text(
          //             'Posts',
          //             style: AppTextStyles.styleWeight400(
          //               fontSize: size.width * .03,
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Text(
          //             '298',
          //             style: AppTextStyles.styleWeight500(
          //               fontSize: size.width * .05,
          //             ),
          //           ),
          //           Text(
          //             'Following',
          //             style: AppTextStyles.styleWeight400(
          //               fontSize: size.width * .03,
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Text(
          //             '321K',
          //             style: AppTextStyles.styleWeight500(
          //               fontSize: size.width * .05,
          //             ),
          //           ),
          //           Text(
          //             'Followers',
          //             style: AppTextStyles.styleWeight400(
          //               fontSize: size.width * .03,
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          TabBar(
            controller: tabController,
            // isScrollable: true,
            indicator: MainIndicator(
              indicatorHeight: size.width * .01,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorSize: MainIndicatorSize.normal,
            ),
            indicatorPadding: EdgeInsets.zero,
            // isScrollable: true,
            labelPadding: EdgeInsetsDirectional.only(
              top: size.width * .025,
              bottom: size.width * .035,
              end: size.width * .05,
            ),
            labelStyle:
                AppTextStyles.styleWeight500(fontSize: size.width * .05),
            unselectedLabelStyle:
                AppTextStyles.styleWeight500(fontSize: size.width * .045),
            padding: EdgeInsetsDirectional.only(end: size.width * .25),
            unselectedLabelColor: Colors.grey.shade400,
            labelColor: Theme.of(context).primaryColor,

            tabs: const [
              // Text('Phots'),
              // Text('Plans'),
              Text('Favories'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size.width * .3;

  @override
  double get minExtent => size.width * .3;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
