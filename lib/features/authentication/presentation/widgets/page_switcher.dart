import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/features/authentication/presentation/utils/bubble_indicator_painter.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 90,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Text(
                  'Create Account',
                  style: AppTextStyles.styleWeight400(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Text(
                  'Login',
                  style: AppTextStyles.styleWeight400(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
