import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';

class TextButtonProfile extends StatelessWidget {
  const TextButtonProfile({
    Key? key,
    this.child,
    required this.title,
    required this.size,
    required this.onPressed,
  }) : super(key: key);
  final Widget? child;
  final void Function() onPressed;
  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.width * .15,
      child: TextButton(
        style: ButtonStyle(
          alignment: AlignmentDirectional.centerStart,
          elevation: MaterialStateProperty.all(.25),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).scaffoldBackgroundColor),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.styleWeight300(
                color: Colors.black,
                fontSize: size.width * .043,
              ),
            ),
            const Spacer(),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
