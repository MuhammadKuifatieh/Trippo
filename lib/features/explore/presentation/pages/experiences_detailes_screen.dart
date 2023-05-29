import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../place/presentation/pages/place_screen.dart';
import '../blocs/experince_detailes/experince_detailes_bloc.dart';

part '../widgets/places_experince_list.dart';

class ExperiencesDetailesScreen extends StatefulWidget {
  static const String routeName = "experiences_detailes_screen";
  const ExperiencesDetailesScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final ExperiencesDetailesScreenParams arg;

  @override
  State<ExperiencesDetailesScreen> createState() =>
      _ExperiencesDetailesScreenState();
}

class _ExperiencesDetailesScreenState extends State<ExperiencesDetailesScreen> {
  late final Size size;
  late ExperinceDetailesBloc experinceDetailesBloc;
  @override
  void initState() {
    experinceDetailesBloc = ExperinceDetailesBloc()
      ..add(GetExperinceDetailesEvent(id: widget.arg.id));
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
      create: (context) => experinceDetailesBloc,
      child: BlocConsumer<ExperinceDetailesBloc, ExperinceDetailesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.arg.name,
                style: AppTextStyles.styleWeight700(
                  color: Theme.of(context).primaryColor,
                  fontSize: size.width * .065,
                ).copyWith(height: 2.5),
              ),
              elevation: 0,
            ),
            body: state.experinceDetailesStatus ==
                        ExperinceDetailesStatus.loading ||
                    state.experinceDetailesStatus ==
                        ExperinceDetailesStatus.init
                ? SizedBox(
                    height: size.height * .6,
                    child: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Theme.of(context).primaryColor,
                        size: size.width * .1,
                      ),
                    ),
                  )
                : state.experinceDetailesStatus ==
                        ExperinceDetailesStatus.falied
                    ? MainErrorWidget(
                        size: size,
                        onTapRety: () {
                          experinceDetailesBloc.add(
                              GetExperinceDetailesEvent(id: widget.arg.id));
                        },
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.width * .1),
                              SizedBox(
                                height: size.width * .75,
                                child: ListView.builder(
                                  itemCount: state.experience!.images!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          end: 12),
                                      child: SizedBox(
                                        width: size.width * .55,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CacheImage(
                                              width: size.width * .55,
                                              height: size.width * .7,
                                              imageUrl: state.experience!
                                                  .images![index].url!,
                                              hash: state.experience!
                                                  .images![index].hash,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade400,
                                                  blurRadius: 1.5,
                                                  offset: const Offset(0, 5),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: size.width * .05),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.about,
                                      style: AppTextStyles.styleWeight900(
                                        fontSize: size.width * .05,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      state.experience!.about!,
                                      style: AppTextStyles.styleWeight400(
                                        fontSize: size.width * .04,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      AppLocalizations.of(context)!.address,
                                      style: AppTextStyles.styleWeight900(
                                        fontSize: size.width * .05,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      state.experience!.address!,
                                      style: AppTextStyles.styleWeight400(
                                        fontSize: size.width * .04,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "${AppLocalizations.of(context)!.views} : ${state.experience!.views!}",
                                      style: AppTextStyles.styleWeight600(
                                        fontSize: size.width * .045,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "${AppLocalizations.of(context)!.price} : ${state.experience!.priceBegin!} ${AppLocalizations.of(context)!.sp} ",
                                      style: AppTextStyles.styleWeight600(
                                        fontSize: size.width * .045,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.width * .05),
                              _PlacesExperinceList(
                                  size: size,
                                  experinceDetailesBloc: experinceDetailesBloc,
                                  experinceDetailesState: state)
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}

class ExperiencesDetailesScreenParams {
  final String id;
  final String name;

  ExperiencesDetailesScreenParams({
    required this.id,
    required this.name,
  });
}
