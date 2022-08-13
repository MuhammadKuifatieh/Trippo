import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/place_tile.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late final PageController _pageController;
  late ValueNotifier<int> currentPageIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    currentPageIndex = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.width * 0.68,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    currentPageIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    return CacheImage(
                      width: size.width,
                      height: size.width * 0.68,
                      imageUrl:
                          "https://i0.wp.com/iqr2.com/wp-content/uploads/2022/05/%D8%AD%D9%84%D8%A8_%D8%A7%D9%84%D8%B4%D9%87%D8%A8%D8%A7%D8%A1.jpg?resize=600%2C300&ssl=1",
                    );
                  },
                  itemCount: 10,
                ),
                Positioned(
                  right: 16,
                  bottom: 18,
                  child: ValueListenableBuilder<int>(
                      valueListenable: currentPageIndex,
                      builder: (context, value, _) {
                        return Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            '${value + 1}/999+',
                            style: AppTextStyles.styleWeight500(
                                color: Colors.white),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Text(
              'حلب',
              style: AppTextStyles.styleWeight700(fontSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "من اقدم المدن في التاريخ وتعد عاصمة سوريا الاقتصادية والصناعية وتحتوي على عدة مواقع أثرية واهمها قلعة حلب ومدينتها القديمة",
              style: AppTextStyles.styleWeight400(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'عرض المزيد',
                  style: AppTextStyles.styleWeight500(fontSize: 16)
                      .copyWith(decoration: TextDecoration.underline),
                ),
                const SizedBox(width: 4),
                AssetSvg(
                  SvgImages.arrowDown,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            margin: const EdgeInsetsDirectional.only(start: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AssetSvg(
                  SvgImages.openedLock,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'عرض على الخريطة',
                  style: AppTextStyles.styleWeight500(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          ListHeader(
            title: 'أماكن للاقامة',
            description: lorem(paragraphs: 1, words: 15),
            seeAllHandler: () {
              widget.tabController.animateTo(1);
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: PlaceTile(size: size, imageUrl: testImageUrl),
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(height: 50),
          ListHeader(
            title: 'انشطة للقيام بها',
            description: lorem(paragraphs: 1, words: 15),
            seeAllHandler: () {
              widget.tabController.animateTo(2);
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: PlaceTile(size: size, imageUrl: testImageUrl),
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(height: 50),
          ListHeader(
            title: 'مطاعم',
            description: lorem(paragraphs: 1, words: 15),
            seeAllHandler: () {
              widget.tabController.animateTo(3);
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: PlaceTile(size: size, imageUrl: testImageUrl),
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اسئلة واجوبة',
                  style: AppTextStyles.styleWeight600(
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'إضافة سؤال',
                    style: AppTextStyles.styleWeight500(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              CacheImage(
                                width: size.width * 0.12,
                                height: size.width * 0.12,
                                imageUrl: testImageUrl,
                                shape: BoxShape.circle,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'A7MED SI',
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 12),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Machester, UK',
                                    style: AppTextStyles.styleWeight400(
                                        fontSize: 10),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '10 contributers',
                                    style: AppTextStyles.styleWeight400(
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 20,
                            top: 0,
                            child: const Icon(Icons.more_vert),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        lorem(paragraphs: 1, words: 12),
                        style: AppTextStyles.styleWeight400(),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        '24 Aprit 2022',
                        style: AppTextStyles.styleWeight300(fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key? key,
    required this.title,
    required this.description,
    this.seeAllHandler,
  }) : super(key: key);

  final String title;
  final String description;
  final void Function()? seeAllHandler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.styleWeight600(fontSize: 24),
              ),
              InkWell(
                onTap: seeAllHandler,
                child: Text(
                  'عرض الكل',
                  style: AppTextStyles.styleWeight500(fontSize: 16)
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyles.styleWeight400(fontSize: 14)
                .copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}
