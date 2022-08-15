import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:trippo/core/widgets/main_button.dart';
import 'package:trippo/features/city/presentation/blocs/city/city_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/questions_screen.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/loading_screen.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../../core/widgets/place_tile.dart';
import '../../../home/data/models/cities_response.dart';
import 'add_question_sheet.dart';
import 'list_header.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    Key? key,
    required this.tabController,
    required this.cityId,
  }) : super(key: key);
  final TabController tabController;
  final int cityId;
  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late final PageController _pageController;
  late ValueNotifier<int> currentPageIndex;
  late final CityBloc cityBloc;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    currentPageIndex = ValueNotifier(0);
    cityBloc = context.read<CityBloc>();
    cityBloc.add(GetCityEvent(cityId: widget.cityId));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.cityStatus == GetCityStatus.loading ||
            state.cityStatus == GetCityStatus.initial) {
          return const LoadingScreen();
        }
        // else if (state.cityStatus == GetCityStatus.failure) {
        //   return MainErrorWidget(
        //       size: size,
        //       onTapRety: () {
        //         cityBloc.add(GetCityEvent(cityId: widget.cityId));
        //       });
        // }
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
                          imageUrl: state.city.images![index].url!,
                        );
                      },
                      itemCount: state.city.images!.length,
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
                                '${value + 1}/${state.city.images!.length}',
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
                  state.city.name ?? 'No Name',
                  style: AppTextStyles.styleWeight700(fontSize: 28),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  state.city.description ?? 'No Description',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) {
                            return AddQuestionSheet(
                              cityBloc: context.read<CityBloc>(),
                              city: state.city,
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
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
                    ),
                    const SizedBox(height: 20),
                    MainButton(
                      child: Text('Show All Questions'),
                      height: 50,
                      width: 120,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          QuestionsScreen.routeName,
                          arguments: CityModel(
                            id: 2,
                            name: 'Aleppo',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
