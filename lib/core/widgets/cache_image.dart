import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trippo/core/pages/image_screen.dart';

// import 'package:intl/intl.dart';
import '../config/global_functions.dart';

class CacheImage extends StatelessWidget {
  const CacheImage(
      {Key? key,
      required this.width,
      required this.height,
      required this.imageUrl,
      this.child,
      this.border,
      this.boxShadow,
      this.borderRadius,
      this.fit = BoxFit.cover,
      this.shape = BoxShape.rectangle,
      this.hash = "AEO2?U-W}SQ[",
      this.isPushed = false})
      : super(key: key);
  final BoxFit fit;
  final String? hash;
  final double width;
  final double height;
  final BoxShape shape;
  final String imageUrl;
  final Widget? child;
  final BoxBorder? border;
  final bool isPushed;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      height: height,
      width: width,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Stack(
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: shape == BoxShape.rectangle
                          ? (borderRadius ?? BorderRadius.zero)
                          : BorderRadius.circular(1000),
                    ),
                    textDirection:
                        GlobalFunctions().isRTLDirectionality(context)
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                  ),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: BlurHash(
                      // image: imageUrl,
                      // imageFit: fit,
                      // duration: const Duration(milliseconds: 1500),
                      // curve: Curves.linear,
                      hash: hash!,
                    ),
                  ),
                ),
                Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.white,
                    size: width / 6,
                  ),
                ),
              ],
            );

          case LoadState.completed:
            return isPushed
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ImageScreen(
                                imageUrl: imageUrl,
                              )));
                    },
                    child: Container(
                      width: width,
                      height: height,
                      child: child,
                      decoration: BoxDecoration(
                        border: border,
                        shape: shape,
                        boxShadow: boxShadow,
                        borderRadius: borderRadius,
                        image: DecorationImage(
                          image: state.imageProvider,
                          fit: fit,
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: width,
                    height: height,
                    child: child,
                    decoration: BoxDecoration(
                      border: border,
                      shape: shape,
                      boxShadow: boxShadow,
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: state.imageProvider,
                        fit: fit,
                      ),
                    ),
                  );
          case LoadState.failed:
            return GestureDetector(
              onTap: () {
                state.reLoadImage();
              },
              child: Stack(
                children: [
                  ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: shape == BoxShape.rectangle
                            ? (borderRadius ?? BorderRadius.zero)
                            : BorderRadius.circular(1000),
                      ),
                      textDirection:
                          GlobalFunctions().isRTLDirectionality(context)
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: BlurHash(
                        // image: imageUrl,
                        // imageFit: fit,
                        // duration: const Duration(milliseconds: 1500),
                        // curve: Curves.linear,
                        hash: hash!,
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.refresh,
                      size: width / 6,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );

          default:
        }
      },
    );
  }
}
