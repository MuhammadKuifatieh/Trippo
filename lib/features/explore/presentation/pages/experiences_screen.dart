import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trippo/core/widgets/main_error_widget.dart';
import 'package:trippo/features/explore/data/models/experienes_response.dart';
import 'package:trippo/features/explore/presentation/blocs/experinces/experinces_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import 'experiences_detailes_screen.dart';

part '../widgets/experience_card.dart';

class ExperinecesScreen extends StatefulWidget {
  static const String routeName = "experience_screen";
  const ExperinecesScreen({Key? key}) : super(key: key);

  @override
  State<ExperinecesScreen> createState() => _ExperinecesScreenState();
}

class _ExperinecesScreenState extends State<ExperinecesScreen> {
  late Size size;
  PageController pageController = PageController();
  late final ExperincesBloc experincesBloc;
  @override
  void initState() {
    experincesBloc = ExperincesBloc()..add(const GetExperincesEvent());
    pageController.addListener(_onScroll);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => experincesBloc,
      child: BlocConsumer<ExperincesBloc, ExperincesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                experincesBloc.add(const GetExperincesEvent(isReload: true));
              },
              child: state.experincesStatus == ExperincesStatus.loading ||
                      state.experincesStatus == ExperincesStatus.init
                  ? SizedBox(
                      height: size.height,
                      child: Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: Theme.of(context).primaryColor,
                          size: size.width * .1,
                        ),
                      ),
                    )
                  : state.experincesStatus == ExperincesStatus.falied
                      ? MainErrorWidget(
                          size: size,
                          onTapRety: () {
                            experincesBloc
                                .add(const GetExperincesEvent(isReload: true));
                          },
                        )
                      : PageView.builder(
                          controller: pageController,
                          scrollDirection: Axis.vertical,
                          itemCount: state.experiences.length,
                          itemBuilder: (context, index) => _ExperienceCard(
                            experience: state.experiences[index],
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      experincesBloc.add(const GetExperincesEvent());
    }
  }

  bool get _isBottom {
    if (!pageController.hasClients) return false;
    final maxScroll = pageController.position.maxScrollExtent;
    final currentScroll = pageController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
