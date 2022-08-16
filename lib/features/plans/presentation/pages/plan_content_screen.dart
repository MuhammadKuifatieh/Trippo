import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/presentation/blocs/plan_content/plan_content_bloc.dart';
import 'package:trippo/features/plans/presentation/widgets/plan_content_card.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';

class PlanContentScreen extends StatefulWidget {
  const PlanContentScreen({
    Key? key,
    required this.plan,
  }) : super(key: key);
  static const routeName = '/plan-content';
  final PlanModel plan;

  @override
  State<PlanContentScreen> createState() => _PlanContentScreenState();
}

class _PlanContentScreenState extends State<PlanContentScreen> {
  late final PlanContentBloc planContentBloc;
  late Size size;

  @override
  void initState() {
    super.initState();
    planContentBloc = PlanContentBloc();
    planContentBloc.add(PlanContentFetched(widget.plan.id));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => planContentBloc,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Plan Content',
            style: AppTextStyles.styleWeight600(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ).copyWith(height: 1),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AssetSvg(
                SvgImages.arrowBackward,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.plan.name,
                style: AppTextStyles.styleWeight700(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'About this plan:',
                style: AppTextStyles.styleWeight700(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.plan.description ?? "No Description",
                style: AppTextStyles.styleWeight500(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Places in this plan:',
                style: AppTextStyles.styleWeight700(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<PlanContentBloc, PlanContentState>(
                builder: (context, state) {
                  if (state.status == PlanContentStatus.initial) {
                    return const LoadingScreen();
                  } else if (state.status == PlanContentStatus.failure) {
                    return MainErrorWidget(
                        size: size,
                        onTapRety: () {
                          planContentBloc
                              .add(PlanContentFetched(widget.plan.id));
                        });
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return PlanContentCard(
                        planContent: state.planContents[index],
                      );
                    },
                    itemCount: state.planContents.length,
                    shrinkWrap: true,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
