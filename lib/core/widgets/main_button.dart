
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.onTap,
    this.color,
    this.border,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double width;
  final double height;
  final BorderSide? border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onTap,
        
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: border ?? BorderSide.none,
            ),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
