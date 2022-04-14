import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
// import 'package:intl/intl.dart';
import '../common/global_function.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.child,
    this.border,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
    this.hash = "L5H2EC=PM+yV0g-mq.wG9c010J}I",
  }) : super(key: key);
  final BoxFit fit;
  final String hash;
  final double width;
  final double height;
  final BoxShape shape;
  final String imageUrl;
  final Widget? child;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          child: child,
          decoration: BoxDecoration(
            border: border,
            shape: shape,
            borderRadius: borderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (context, url) => ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: shape == BoxShape.rectangle
                ? borderRadius!
                : BorderRadius.circular(1000),
          ),
          textDirection: GlobalFunction().isRTLDirectionality(context)
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: BlurHash(
            hash: hash,
          ),
        ),
      ),
    );
  }
}
