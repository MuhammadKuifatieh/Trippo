import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/widgets/cache_image.dart';
import 'package:trippo/core/widgets/image_setter.dart';
import 'package:trippo/core/widgets/main_button.dart';
import 'package:trippo/core/widgets/main_text_field.dart';
import 'package:collection/collection.dart';
import 'package:trippo/features/explore/presentation/blocs/add_experince/add_experince_bloc.dart';
import 'package:trippo/features/explore/presentation/widgets/select_places_dialog.dart';

class AddExperinceSrceen extends StatefulWidget {
  const AddExperinceSrceen({Key? key}) : super(key: key);
  static const routeName= "add_experince_srceen";

  @override
  State<AddExperinceSrceen> createState() => _AddExperinceSrceenState();
}

class _AddExperinceSrceenState extends State<AddExperinceSrceen> {
  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController addressController;
  late TextEditingController priceContoller;
  final ValueNotifier<List<String?>> images = ValueNotifier([null]);
  late AddExperinceBloc addExperinceBloc;
  late Size size;

  @override
  void initState() {
    addExperinceBloc = AddExperinceBloc();
    nameController = TextEditingController();
    aboutController = TextEditingController();
    addressController = TextEditingController();
    priceContoller = TextEditingController();
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
      create: (context) => addExperinceBloc,
      child: BlocConsumer<AddExperinceBloc, AddExperinceState>(
        listener: (context, state) {
          if (state.addExperinceStatus == AddExperinceStatus.loading) {
            BotToast.showLoading();
          } else if (state.addExperinceStatus == AddExperinceStatus.succ) {
            BotToast.closeAllLoading();
            Navigator.pop(context);
          } else if (state.addExperinceStatus == AddExperinceStatus.falied) {
            BotToast.closeAllLoading();
            BotToast.showText(text: "حدث خطأ ما");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("إضافة تجربة سياحية"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextField(
                      hintText: "الاسم",
                      controller: nameController,
                    ),
                    const SizedBox(height: 12),
                    MainTextField(
                      hintText: "التفاصيل",
                      controller: aboutController,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 12),
                    MainTextField(
                      hintText: "العنوان",
                      controller: addressController,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    MainTextField(
                      hintText: "السعر",
                      controller: priceContoller,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: size.width * .075,
                    ),
                    Text(
                      "الصور",
                      style: AppTextStyles.styleWeight600(
                        color: Theme.of(context).primaryColor,
                        fontSize: size.width * .05,
                      ),
                    ),
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
                                    height: size.width * .3,
                                    width: size.width * .3,
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                    Wrap(
                        children: state.selectedPlaces
                            .map((e) => SizedBox(
                                  width: size.width * .2,
                                  child: GestureDetector(
                                    onTap: () {
                                      addExperinceBloc
                                          .add(RemveToSelectedPlaces(place: e));
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CacheImage(
                                            width: size.width * .175,
                                            height: size.width * .175,
                                            shape: BoxShape.circle,
                                            imageUrl: e.images![0].url!),
                                        SizedBox(height: size.width * .015),
                                        Flexible(
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                        // Spacer(flex: 2,),
                                        SizedBox(
                                          height: size.width * .075,
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                          ..add(
                            SizedBox(
                              child: MainButton(
                                border: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Text(
                                  'إضافة',
                                  style: AppTextStyles.styleWeight500(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: size.width * .04,
                                  ),
                                ),
                                height: size.width * .25,
                                width: size.width * .25,
                                color: Colors.white,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SelectUserDialog(
                                      size: size,
                                      addExperinceBloc: addExperinceBloc,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    Center(
                      child: MainButton(
                        child: Text(
                          'Add Experince',
                          style: AppTextStyles.styleWeight500(
                            color: Colors.white,
                            fontSize: size.width * .04,
                          ),
                        ),
                        height: size.width * .1,
                        width: size.width * .75,
                        onTap: () {
                          if (images.value.length > 1 &&
                              nameController.text.isNotEmpty &&
                              addressController.text.isNotEmpty &&
                              aboutController.text.isNotEmpty &&
                              priceContoller.text.isNotEmpty) {
                            addExperinceBloc.add(
                              GoAddExperinceEvent(
                                images: images.value,
                                name: nameController.text,
                                address: addressController.text,
                                about: aboutController.text,
                                price: priceContoller.text,
                              ),
                            );
                          } else {
                            BotToast.showText(
                                text: "تأكد من تعبئة كافة البييانات");
                          }
                        },
                      ),
                    ),
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
