import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/image_upload/image_upload_bloc.dart';
import '../config/croper/cropp.dart';

class ImageSetter extends StatefulWidget {
  ImageSetter({
    Key? key,
    required this.onChange,
    required this.height,
    required this.width,
  }) : super(key: key);
  final void Function(String?) onChange;
  final double width;
  final double height;

  @override
  State<ImageSetter> createState() => _ImageSetterState();
}

class _ImageSetterState extends State<ImageSetter> {
  late final ValueNotifier<Uint8List?> image;
  late final ImageUploadBloc imageUploadBloc;
  @override
  void initState() {
    image = ValueNotifier(null);
    imageUploadBloc = ImageUploadBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => imageUploadBloc,
      child: BlocConsumer<ImageUploadBloc, ImageUploadState>(
        listener: (context, state) {
          widget.onChange(state.imageName);
        },
        builder: (context, state) {
          return ValueListenableBuilder<Uint8List?>(
            valueListenable: image,
            builder: (context, imageValue, _) {
              return imageValue == null
                  ? GestureDetector(
                      onTap: () async {
                        var value = await getAndCropImage(context);
                        if (value != null) {
                          image.value = value;
                          imageUploadBloc.add(SetImageEvent(image: value));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: widget.width,
                        height: widget.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Stack(
                        children: [
                          // Container(
                          //   width: 200,
                          //   height: 200,
                          // ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.memory(
                              imageValue,
                              width: widget.width,
                              height: widget.height,
                              fit: BoxFit.cover,
                            ),
                          ),
                          PositionedDirectional(
                            top: 3,
                            start: 3,
                            child: GestureDetector(
                              onTap: () {
                                imageUploadBloc.add(RemoveImageEvent());
                                image.value = null;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: size.width * .05,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          if (state.status == ImageUploadStatus.loading)
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              start: 0,
                              bottom: 0,
                              child: Center(
                                child: LoadingAnimationWidget.threeArchedCircle(
                                  color: Theme.of(context).primaryColor,
                                  size: size.width * .1,
                                ),
                              ),
                            ),
                          if (state.status == ImageUploadStatus.failed)
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              start: 0,
                              bottom: 0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    imageUploadBloc
                                        .add(const GoImageUploadEvent());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.refresh,
                                      size: size.width * .05,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
