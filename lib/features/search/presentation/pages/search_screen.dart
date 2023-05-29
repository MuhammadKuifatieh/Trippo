import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../profile/presentation/widgets/small_place_card.dart';
import '../bloc/search/search_bloc.dart';
import '../widgets/filter_widget.dart';
import '../widgets/serch_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = 'explroe_screen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late Size size;
  late SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc()..add(const GetAllInfoToSearchEvent());
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  title: Text(
                    AppLocalizations.of(context)!.search,
                    style: AppTextStyles.styleWeight500(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  bottom: Tab(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearcAppBar(
                          onChange: (text) {
                            searchBloc
                                .add(ChangeFiltterSearchEvent(name: text));
                          },
                          onSubmit: (text) {
                            searchBloc.add(const GetPlacesToSearchEvent());
                          },
                        ),
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
                                        value: context.read<SearchBloc>(),
                                        child: const FilterWidget(),
                                      );
                                    },
                                  );
                                },
                                labelPadding:
                                    const EdgeInsets.only(left: 1, right: 2),
                                label: Text(
                                  AppLocalizations.of(context)!.fitter,
                                  style: AppTextStyles.styleWeight500(
                                      fontSize: 15),
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
                      ],
                    ),
                  ),
                )
              ];
            },
            body: Scaffold(
              body: state.getPlacesToSearchStatus ==
                      GetPlacesToSearchStatus.loading
                  ? Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Theme.of(context).primaryColor,
                        size: size.width * .1,
                      ),
                    )
                  : state.getPlacesToSearchStatus ==
                          GetPlacesToSearchStatus.failed
                      ? MainErrorWidget(
                          size: size,
                          onTapRety: () {
                            searchBloc.add(const GetPlacesToSearchEvent());
                          })
                      : ListView.builder(
                          itemCount: state.places.length,
                          itemBuilder: (context, index) => SmallPlaceCard(
                            size: size,
                            place: state.places[index],
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
