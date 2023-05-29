import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../bloc/search/search_bloc.dart';
import '../widgets/list_items.dart';
import 'bottom_filter_widget.dart';
import 'filter_item.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return SizedBox(
            height: (MediaQuery.of(context).size.height * 0.965),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .225,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.fitter,
                        style: AppTextStyles.styleWeight500(fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .75,
                    child: SingleChildScrollView(
                      physics:
                          const ScrollPhysics(parent: BouncingScrollPhysics()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilterItem(
                              filterName:
                                  AppLocalizations.of(context)!.palces_ratting,
                              widgets: state.ratting.mapIndexed(
                                (index, rate) {
                                  return ListItems(
                                    onSelect: (selected) {
                                      log("on select is:$selected");
                                      context.read<SearchBloc>().add(
                                            ChangeFiltterSearchEvent(
                                                selectedIndexRatting: index ==
                                                        state
                                                            .selectedIndexRatting
                                                    ? -1
                                                    : index),
                                          );
                                    },
                                    select: state.selectedIndexRatting == index,
                                    widget: MainRatingBar(
                                      isFiter: true,
                                      filterRating: double.parse(
                                        state.ratting[index].toString(),
                                      ),
                                    ),
                                  );
                                },
                              ).toList()),
                          FilterItem(
                            filterName: AppLocalizations.of(context)!.city,
                            widgets: state.cities.mapIndexed(
                              (index, city) {
                                return ListItems(
                                  onSelect: (selected) {
                                    log("on select is:$selected");
                                    context.read<SearchBloc>().add(
                                          ChangeFiltterSearchEvent(
                                            selectedIndexCity:
                                                index == state.selectedIndexCity
                                                    ? -1
                                                    : index,
                                          ),
                                        );
                                  },
                                  select: index == state.selectedIndexCity,
                                  widget: Text(city.name!),
                                );
                              },
                            ).toList(),
                          ),
                          FilterItem(
                            filterName:
                                AppLocalizations.of(context)!.feature_title,
                            widgets: state.featureTitles.mapIndexed(
                              (index, featureTitle) {
                                return ListItems(
                                  onSelect: (selected) {
                                    log("on select is:$selected");
                                    context.read<SearchBloc>().add(
                                        ChangeFiltterSearchEvent(
                                            selectedIndexFeatureTitle: index ==
                                                    state
                                                        .selectedIndexFeatureTitle
                                                ? -1
                                                : index));
                                  },
                                  select:
                                      index == state.selectedIndexFeatureTitle,
                                  widget: Text(
                                    featureTitle.title!,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: (state.selectedIndexFeatureTitle != -1 &&
                                      state
                                          .featureTitles[
                                              state.selectedIndexFeatureTitle]
                                          .features!
                                          .isNotEmpty)
                                  ? FilterItem(
                                      filterName:
                                          AppLocalizations.of(context)!.feature,
                                      widgets: state
                                          .featureTitles[
                                              state.selectedIndexFeatureTitle]
                                          .features!
                                          .mapIndexed((index, feature) {
                                        return ListItems(
                                            onSelect: (selected) {
                                              log("on select is:$selected");
                                              context
                                                  .read<SearchBloc>()
                                                  .add(ChangeFiltterSearchEvent(
                                                    selectedIndexFeature: index ==
                                                            state
                                                                .selectedIndexFeature
                                                        ? -1
                                                        : index,
                                                  ));
                                            },
                                            select: index ==
                                                state.selectedIndexFeature,
                                            widget: Text(feature.title!));
                                      }).toList())
                                  : Container(),
                            ),
                          ),
                          FilterItem(
                              filterName: AppLocalizations.of(context)!.type,
                              widgets: state.types.mapIndexed((index, type) {
                                return ListItems(
                                    onSelect: (selected) {
                                      log("on select is:$selected");
                                      context.read<SearchBloc>().add(
                                          ChangeFiltterSearchEvent(
                                              selectedIndexType: index ==
                                                      state.selectedIndexType
                                                  ? -1
                                                  : index));
                                    },
                                    select: index == state.selectedIndexType,
                                    widget: Text(type.name!));
                              }).toList()),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: (state.selectedIndexType != -1 &&
                                    state.types[state.selectedIndexType]
                                        .options!.isNotEmpty)
                                ? FilterItem(
                                    filterName:
                                        AppLocalizations.of(context)!.option,
                                    widgets: state
                                        .types[state.selectedIndexType].options!
                                        .mapIndexed(
                                      (index, option) {
                                        return ListItems(
                                            onSelect: (selected) {
                                              log("on select is:$selected");
                                              context
                                                  .read<SearchBloc>()
                                                  .add(ChangeFiltterSearchEvent(
                                                    selectedIndexOption: index ==
                                                            state
                                                                .selectedIndexOption
                                                        ? -1
                                                        : index,
                                                  ));
                                            },
                                            select: index ==
                                                state.selectedIndexOption,
                                            widget: Text(option.name!));
                                      },
                                    ).toList())
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    child: BottomFilterWidget(),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
