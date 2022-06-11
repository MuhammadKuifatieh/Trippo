
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../bloc/filter_bloc.dart';

class BottomFilterWidget extends StatelessWidget {
  const BottomFilterWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 25),
            child: ActionChip(
                side: BorderSide(
                    width: 1.5, color: Theme.of(context).primaryColor),
                backgroundColor: Colors.transparent,
                label: Text(
                  "Clear Filter",
                  style: AppTextStyles.styleWeight600(
                      fontSize: 15, color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                   context.read<FilterBloc>().add(ClearFilter());
                  Navigator.of(context).pop();
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 25),
            child: ActionChip(
                side: BorderSide(
                    width: 1.5, color: Theme.of(context).primaryColor),
                label: Text(
                  "Show Reviews",
                  style: AppTextStyles.styleWeight600(
                      fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  context.read<FilterBloc>().add(GetFilterName());
                  Navigator.of(context).pop();
                },
                backgroundColor: Theme.of(context).primaryColor),
          ),
        ],
      );
    });
  }
}
