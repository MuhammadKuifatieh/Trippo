import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/place/presentation/bloc/bloc/plans_bloc.dart';
import 'package:trippo/features/place/presentation/widgets/plan_card.dart';

import '../../../../core/config/app_text_styles.dart';
import 'add_plan_dialog.dart';

class PlansSheet extends StatefulWidget {
  const PlansSheet({
    Key? key,
    required this.cityId,
    required this.cityName,
  }) : super(key: key);
  final int cityId;
  final String cityName;
  @override
  State<PlansSheet> createState() => _PlansSheetState();
}

class _PlansSheetState extends State<PlansSheet> {
  late final PlansBloc plansBloc;
  late Size size;

  @override
  void initState() {
    super.initState();
    plansBloc = PlansBloc();
    plansBloc.add(UserPlansFetched(cityId: widget.cityId));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => plansBloc,
      child: BlocListener<PlansBloc, PlansState>(
        listener: (context, state) {
          if (state.addingDeletingStatus == AddingDeletingStatus.loading) {
            BotToast.showLoading();
          } else if (state.addingDeletingStatus ==
                  AddingDeletingStatus.failure ||
              state.addingDeletingStatus == AddingDeletingStatus.success) {
            BotToast.closeAllLoading();
            BotToast.showText(text: state.notifyMessage);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<PlansBloc, PlansState>(
                builder: (context, state) {
                  if (state.plansFetchingStatus ==
                      PlansFetchingStatus.initial) {
                    return const SizedBox(
                      height: 200,
                      child: LoadingScreen(),
                    );
                  } else if (state.plansFetchingStatus ==
                      PlansFetchingStatus.failure) {
                    return MainErrorWidget(
                        size: size,
                        onTapRety: () {
                          plansBloc
                              .add(UserPlansFetched(cityId: widget.cityId));
                        });
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.width * .025,
                              bottom: size.width * .05,
                            ),
                            child: Container(
                              width: size.width * .225,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Add To Your Plans in ${widget.cityName}',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .06,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return PlanCard(plan: state.plans[index]);
                          },
                          itemCount: state.plans.length,
                          shrinkWrap: true,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              right: 8,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddPlanDialog(
                        plansBloc: plansBloc,
                        cityId: widget.cityId,
                        cityName: widget.cityName,
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
