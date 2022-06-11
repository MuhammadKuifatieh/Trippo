import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../bloc/filter_bloc.dart';
import 'bottom_filter_widget.dart';
import 'filter_item.dart';
import 'list_items.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
    required this.rating,
    required this.review,
    required this.month,
  }) : super(key: key);

  final List<double> rating;
  final List<double> review;
  final List<String> month;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return SizedBox(
            height: (MediaQuery.of(context).size.height * 0.965),
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
                      'Filter',
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
                            items: rating,
                            filterName: "Traveler Rating",
                            widgets: rating.map((rate) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemRating(
                                          isSelected: selected,
                                          item: rate,
                                          itemTitle: "Traveler Rating",
                                        ));
                                  },
                                  select: state.ratingData.contains(rate),
                                  widget: MainRatingBar(
                                      isFiter: true, filterRating: rate));
                            }).toList()),
                        FilterItem(
                            items: review,
                            filterName: "Review Date",
                            widgets: review.map((text) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemReviewDate(
                                          isSelected: selected,
                                          item: text,
                                          itemTitle: "Review Date",
                                        ));
                                  },
                                  select: state.reviewDate.contains(text),
                                  widget: Text("$text"));
                            }).toList()),
                        FilterItem(
                            items: month,
                            filterName: "Time of Year",
                            widgets: month.map((text) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemTimeOfYear(
                                          isSelected: selected,
                                          item: text,
                                          itemTitle: "Time of Year",
                                        ));
                                  },
                                  select: state.timeOfYear.contains(text),
                                  widget: Text(text));
                            }).toList()),
                        FilterItem(
                            items: month,
                            filterName: "Type Of Visit",
                            widgets: month.map((text) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemTypeOfVisit(
                                          isSelected: selected,
                                          item: text,
                                          itemTitle: "Type Of Visit",
                                        ));
                                  },
                                  select: state.typeOfVisit.contains(text),
                                  widget: Text(text));
                            }).toList()),
                        FilterItem(
                            items: month,
                            filterName: "Type Of Visit2",
                            widgets: month.map((text) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemtypeOfVisit2(
                                          isSelected: selected,
                                          item: text,
                                          itemTitle: "Type Of Visit2",
                                        ));
                                  },
                                  select: state.typeOfVisit2.contains(text),
                                  widget: Text(text));
                            }).toList()),
                        FilterItem(
                            items: month,
                            filterName: "Type Of Visit3",
                            widgets: month.map((text) {
                              return ListItems(
                                  onSelect: (selected) {
                                    print("on select is:$selected");
                                    context
                                        .read<FilterBloc>()
                                        .add(OnPressItemtypeOfVisit3(
                                          isSelected: selected,
                                          item: text,
                                          itemTitle: "Type Of Visit3",
                                        ));
                                  },
                                  select: state.typeOfVisit3.contains(text),
                                  widget: Text(text));
                            }).toList()),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  child: BottomFilterWidget(),
                ),
              ],
            ));
      },
    );
  }
}
