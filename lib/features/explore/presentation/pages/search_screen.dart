import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/bloc/language_manager/language_manager_bloc.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../profile/presentation/widgets/setting_check_box.dart';
import '../bloc/filter_bloc.dart';
import '../widgets/filter_widget.dart';
import '../widgets/serch_app_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = 'explroe_screen';
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  final ScrollController sc = ScrollController();
  late Size size;
  late FilterBloc filterBloc;

  @override
  void initState() {
    super.initState();
    filterBloc = FilterBloc();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  ValueNotifier<bool>? selected;
  List<String> dummy = [
    'search',
    'hotel',
    'home',
    'castle',
    'private',
    'bla',
    'blala',
    'plaplapla',
    'vbc'
  ];
  List<double> review = [100, 2000, 50000, 104555555, 6000000];
  List<double> rating = [1.0, 2.0, 3.0, 4.0, 5.0];
  List<String> month = [
    'jan',
    'fab',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'nov',
    'oct',
    'dec'
  ];
  List<String> selectedData = [];
  List<dynamic> data = [];

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
           SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("Search",style: AppTextStyles.styleWeight500(fontSize: 25,color:Theme.of(context).primaryColor,),),
            bottom:const Tab(
              height: 70,
              child: SearcAppBar(),
            ),
          )
        ];
      },
      body: BlocProvider(
        create: (context) => filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            return Scaffold(
              body: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        spacing: 10,
                        children: [
                          ActionChip(
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (_) {
                                    return BlocProvider.value(
                                        value: context.read<FilterBloc>(),
                                        child: FilterWidget(
                                          rating: rating,
                                          review: review,
                                          month: month,
                                        ));
                                  });
                            },
                            labelPadding:
                                const EdgeInsets.only(left: 1, right: 2),
                            label: Text(
                              'Filter',
                              style: AppTextStyles.styleWeight500(fontSize: 15),
                            ),
                            avatar: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: SvgPicture.asset(
                                SvgImages.filtter,
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5),
                          ),
                          BlocProvider.value(
                            value: context.read<LanguageManagerBloc>(),
                            child: ActionChip(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5),
                                backgroundColor: Colors.transparent,
                                label: Text("English",
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 15)),
                                onPressed: () {
                                  //Show Bottom sheet for choose language
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    constraints: BoxConstraints(
                                        maxHeight: size.width * .75),
                                    builder: (context) => Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.width * .025,
                                              bottom: size.width * .05,
                                            ),
                                            child: Container(
                                              width: size.width * .225,
                                              height: 3,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Change Language",
                                            style: AppTextStyles.styleWeight400(
                                              fontSize: size.width * .07,
                                            ),
                                          ),
                                          Expanded(
                                            child: BlocBuilder<
                                                LanguageManagerBloc,
                                                LanguageManagerState>(
                                              builder: (context, state) {
                                                return ListView.builder(
                                                  itemCount: state
                                                      .supportedLocalesName
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          SettingCheckBox(
                                                    size: size,
                                                    title: state
                                                            .supportedLocalesName[
                                                        index],
                                                    value: state.locale ==
                                                        supportedLocales[index],
                                                    onChanged: (value) {
                                                      if (state.locale
                                                              .languageCode ==
                                                          supportedLocales[
                                                                  index]
                                                              .languageCode) {
                                                        return;
                                                      }
                                                      context
                                                          .read<
                                                              LanguageManagerBloc>()
                                                          .add(
                                                            ChangeLanguageEvent(
                                                              newLocale:
                                                                  supportedLocales[
                                                                      index],
                                                            ),
                                                          );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          ...state.dataData.entries
                              .map((e) => Chip(
                                  backgroundColor: Colors.transparent,
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.5),
                                  label: Text(
                                    e.key + " ${e.value}",
                                    style: AppTextStyles.styleWeight500(
                                        color: Colors.black),
                                  )))
                              .toList()
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Divider(
                        endIndent: 30,
                        thickness: 2,
                        indent: 30,
                      ),
                    ),
                    //TODO: List View Builder for filtered items
                  ]),
            );
          },
        ),
      ),
    );
  }
}
