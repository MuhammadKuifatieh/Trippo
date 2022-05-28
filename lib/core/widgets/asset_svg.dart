import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetSvg extends StatelessWidget {
  const AssetSvg(
    this.assetName, {
    Key? key,
    this.color,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  }) : super(key: key);
  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
