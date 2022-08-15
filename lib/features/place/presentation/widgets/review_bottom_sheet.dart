import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/date_dialog.dart';
import '../../../../core/widgets/image_setter.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../../../../core/widgets/main_text_field.dart';
import '../../domin/usecases/add_review_to_place.dart';
import '../bloc/place/place_bloc.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({
    Key? key,
    required this.size,
    required this.selectedTypeRatting,
    required this.typeRatting,
    required this.placeBloc,
    required this.placeState,
  }) : super(key: key);

  final Size size;
  final ValueNotifier<String?> selectedTypeRatting;
  final List<String> typeRatting;
  final PlaceBloc placeBloc;
  final PlaceState placeState;

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  final ValueNotifier<double> ratting = ValueNotifier(0);
  final ValueNotifier<List<String?>> images = ValueNotifier([null]);
  late final ValueNotifier<int> typeIndex;
  late ValueNotifier<String> dateTime;

  late final TextEditingController titleController;
  late final TextEditingController descreptionContorller;
  @override
  void initState() {
    typeIndex = ValueNotifier(-1);
    titleController = TextEditingController();
    descreptionContorller = TextEditingController();
    dateTime =
        ValueNotifier(intl.DateFormat("yyyy-MM-dd").format(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * .05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.size.width * .025,
                bottom: widget.size.width * .05,
              ),
              child: Container(
                width: widget.size.width * .225,
                height: 3,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: widget.size.height * .8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.rattingReview,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  MainRatingBar(
                    circleSize: widget.size.width * .075,
                    onRatingUpdate: (newRate) {
                      ratting.value = newRate;
                    },
                  ),
                  SizedBox(height: widget.size.width * .05),
                  Text(
                    AppLocalizations.of(context)!.typeReview,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  ValueListenableBuilder<int>(
                      valueListenable: typeIndex,
                      builder: (context, indexValue, _) {
                        return Wrap(
                          children: widget.placeState.visitTypes
                              .mapIndexed((index, e) => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: MainButton(
                                        child: Text(
                                          e.name!,
                                          style: AppTextStyles.styleWeight400(
                                            fontSize: widget.size.width * .04,
                                            color: index != indexValue
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                          ),
                                        ),
                                        height: widget.size.width * .1,
                                        width: widget.size.width * .25,
                                        color: index == indexValue
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        border: index == indexValue
                                            ? null
                                            : BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                        onTap: () {
                                          typeIndex.value = index;
                                        }),
                                  ))
                              .toList(),
                        );
                      }),
                  SizedBox(height: widget.size.width * .05),
                  Text(
                    AppLocalizations.of(context)!.dateReview,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  ValueListenableBuilder<String>(
                      valueListenable: dateTime,
                      builder: (context, selecteDate, _) {
                        return MainButton(
                          child: Text(
                            selecteDate,
                            style: AppTextStyles.styleWeight400(
                              fontSize: widget.size.width * .04,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          height: widget.size.width * .1,
                          width: widget.size.width * .25,
                          color: Colors.white,
                          border: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => DateDialog(
                                title: AppLocalizations.of(context)!.dateReview,
                                onTap: () {},
                                size: widget.size,
                                buttonText:
                                    AppLocalizations.of(context)!.submit,
                                lastDate: DateTime.now(),
                                dateTime: DateTime.parse(selecteDate),
                              ),
                            ).then((value) {
                              if (value != null) {
                                dateTime.value =
                                    intl.DateFormat("yyyy-MM-dd").format(value);
                              }
                            });
                          },
                        );
                      }),
                  SizedBox(height: widget.size.width * .05),
                  Text(
                    AppLocalizations.of(context)!.descreptionReview,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  MainTextField(
                    controller: descreptionContorller,
                    maxLines: 4,
                  ),
                  SizedBox(height: widget.size.width * .05),
                  Text(
                    AppLocalizations.of(context)!.titleReview,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  MainTextField(
                    controller: titleController,
                    maxLines: 2,
                  ),
                  SizedBox(height: widget.size.width * .05),
                  Text(
                    AppLocalizations.of(context)!.photoReivew,
                    style: AppTextStyles.styleWeight600(
                      fontSize: widget.size.width * .04,
                    ),
                  ),
                  SizedBox(height: widget.size.width * .025),
                  ValueListenableBuilder<List<String?>>(
                      valueListenable: images,
                      builder: (context, imagesList, _) {
                        return Wrap(
                          children: imagesList
                              .mapIndexed(
                                (index, element) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ImageSetter(
                                    onChange: (image) {
                                      log(image.toString(), name: "");
                                      if (image != null) {
                                        images.value = List.of(imagesList)
                                          ..insert(index, image);
                                      } else {
                                        log(imagesList[index].toString(),
                                            name: "image123");
                                        if (imagesList[index] != null) {
                                          images.value = List.of(imagesList)
                                            ..removeAt(index);
                                        }
                                      }
                                    },
                                    height: widget.size.width * .275,
                                    width: widget.size.width * .275,
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }),
                  SizedBox(height: widget.size.width * .075),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MainButton(
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          style: AppTextStyles.styleWeight400(
                            fontSize: widget.size.width * .04,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        height: widget.size.width * .11,
                        width: widget.size.width * .4,
                        color: Colors.white,
                        border: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.5),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      MainButton(
                        child: Text(
                          AppLocalizations.of(context)!.submit,
                          style: AppTextStyles.styleWeight400(
                            fontSize: widget.size.width * .04,
                            color: Colors.white,
                          ),
                        ),
                        height: widget.size.width * .11,
                        width: widget.size.width * .4,
                        color: Theme.of(context).primaryColor,
                        onTap: () {
                          if (images.value.length > 1 &&
                              titleController.text.isNotEmpty &&
                              descreptionContorller.text.isNotEmpty &&
                              typeIndex.value != -1 &&
                              ratting.value > 0) {
                            widget.placeBloc.add(
                              AddReviewToPlaceEvent(
                                AddReviewToPlaceParams(
                                  id: widget.placeState.place!.id.toString(),
                                  title: titleController.text,
                                  images: images.value,
                                  ratting: ratting.value,
                                  dateTime: dateTime.value,
                                  description: descreptionContorller.text,
                                  visitTypeId: widget
                                      .placeState.visitTypes[typeIndex.value].id
                                      .toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: widget.size.width * .075),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
