import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_error_widget.dart';
import '../../../home/data/models/places_response.dart';
import '../blocs/add_experince/add_experince_bloc.dart';

class SelectUserDialog extends StatefulWidget {
  const SelectUserDialog({
    Key? key,
    required this.size,
    required this.addExperinceBloc,
  }) : super(key: key);
  final Size size;
  final AddExperinceBloc addExperinceBloc;
  @override
  State<SelectUserDialog> createState() => _SelectUserDialogState();
}

class _SelectUserDialogState extends State<SelectUserDialog> {
  late Size size;

  DateTime? dateTime;

  late FloatingSearchBarController controller;
  late AddExperinceBloc addExperinceBloc;

  @override
  void initState() {
    controller = FloatingSearchBarController();

    addExperinceBloc = widget.addExperinceBloc
      ..add(GetPlacesToAddExperinceEvent());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: BlocProvider.value(
        value: addExperinceBloc,
        child: BlocConsumer<AddExperinceBloc, AddExperinceState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              height: widget.size.width * 1.5,
              width: widget.size.width * .75,
              padding: EdgeInsets.symmetric(
                vertical: widget.size.width * .075,
                horizontal: widget.size.width * .05,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: FloatingSearchBar(
                controller: controller,
                hint: 'search ...',
                scrollPadding: const EdgeInsets.only(top: 0, bottom: 5),
                transitionDuration: const Duration(milliseconds: 0),
                margins: EdgeInsets.all(5),
                transitionCurve: Curves.easeInOut,
                physics: const BouncingScrollPhysics(),
                onQueryChanged: (query) {
                  addExperinceBloc
                      .add(GetPlacesToAddExperinceEvent(name: query));
                },
                onSubmitted: (query) {
                  addExperinceBloc
                      .add(GetPlacesToAddExperinceEvent(name: query));
                  ;
                  controller.close();
                  controller.query = query;
                },
                clearQueryOnClose: true,
                transition: CircularFloatingSearchBarTransition(),
                leadingActions: [FloatingSearchBarAction.back()],
                actions: [
                  FloatingSearchBarAction.searchToClear(
                    showIfClosed: false,
                  ),
                ],
                builder: (context, transition) {
                  return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView.builder(
                      itemCount: state.places.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            addExperinceBloc.add(
                              GetPlacesToAddExperinceEvent(
                                  name: state.places[index].name!),
                            );
                            controller.close();
                            controller.query = state.places[index].name!;
                            controller.query = state.places[index].name!;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                SizedBox(width: widget.size.width * .015),
                                Text(
                                  state.places[index].name!,
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: widget.size.width * .045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.only(top: widget.size.width * .175),
                  child: Column(
                    children: [
                      (state.getPlacesToAddExperince ==
                              GetPlacesToAddExperince.falied)
                          ? MainErrorWidget(
                              size: size,
                              onTapRety: () {
                                addExperinceBloc
                                    .add(GetPlacesToAddExperinceEvent());
                              },
                            )
                          : ((state.getPlacesToAddExperince ==
                                      GetPlacesToAddExperince.loading ||
                                  state.getPlacesToAddExperince ==
                                      GetPlacesToAddExperince.init))
                              ? SizedBox(
                                  height: size.width * .83,
                                  child: Center(
                                      child: SizedBox(
                                          height: size.width * .1,
                                          child:
                                              const CircularProgressIndicator())),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.places.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Stack(
                                          children: [
                                            Row(
                                              children: [
                                                CacheImage(
                                                    width: widget.size.width *
                                                        .175,
                                                    height: widget.size.width *
                                                        .175,
                                                    shape: BoxShape.circle,
                                                    imageUrl: state
                                                        .places[index]
                                                        .images![0]
                                                        .url!),
                                                SizedBox(
                                                    width: widget.size.width *
                                                        .015),
                                                Flexible(
                                                  child: Text(
                                                    state.places[index].name!,
                                                    style: const TextStyle(
                                                      height: 1.5,
                                                    ),
                                                  ),
                                                ),
                                                // Spacer(flex: 2,),
                                                SizedBox(
                                                  width: size.width * .075,
                                                )
                                              ],
                                            ),
                                            PositionedDirectional(
                                              end: size.width * .025,
                                              child: Container(
                                                width: size.width * .075,
                                                child: Checkbox(
                                                  activeColor: Theme.of(context)
                                                      .primaryColor,
                                                  value: placeSelected(
                                                      state.places[index]),
                                                  onChanged: (value) {
                                                    if (value!) {
                                                      addExperinceBloc.add(
                                                          AddToSelectedPlaces(
                                                              place:
                                                                  state.places[
                                                                      index]));
                                                    } else {
                                                      widget.addExperinceBloc
                                                          .add(
                                                        RemveToSelectedPlaces(
                                                          place: state
                                                              .places[index],
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(size.width, size.width * .1)),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 0.5,
                automaticallyImplyBackButton: false,
                automaticallyImplyDrawerHamburger: false,
                isScrollControlled: true,
              ),
            );
          },
        ),
      ),
    );
  }

  bool placeSelected(PlaceModel user) {
    for (var item in addExperinceBloc.state.selectedPlaces) {
      if (item.id == user.id) {
        return true;
      }
    }
    return false;
  }
}
