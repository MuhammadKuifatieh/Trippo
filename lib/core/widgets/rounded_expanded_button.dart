import 'package:flutter/material.dart';

class RoundedExpandedButton extends StatelessWidget {
  const RoundedExpandedButton({
    Key? key,
    this.color,
    this.elevation = 0,
    this.child,
    this.onTap,
  }) : super(key: key);

  final Color? color;
  final double elevation;
  final Widget? child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          shadowColor: const Color(0xff323247),
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
