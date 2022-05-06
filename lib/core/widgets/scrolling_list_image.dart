import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cache_image.dart';

class ScrollingListImage extends StatelessWidget {
  ScrollingListImage({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.imageUrls,
  }) : super(key: key);

  final Size size;
  final double height;
  final double width;
  final List<String> imageUrls;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: PageView.builder(
              controller: pageController,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return CacheImage(
                  imageUrl: imageUrls[index],
                  width: size.width * .9,
                  height: size.width * .6,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 1.5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                );
              }),
        ),
        PositionedDirectional(
          bottom: size.width * .015,
          start: size.width * .015,
          child: SmoothPageIndicator(
            controller: pageController,
            effect: ExpandingDotsEffect(
              spacing: size.width * .01,
              expansionFactor: 4,
              dotHeight: size.width * .0175,
              dotWidth: size.width * .0175,
              paintStyle: PaintingStyle.fill,
              strokeWidth: 1.5,
              dotColor: Colors.white54,
              activeDotColor: Colors.white,
            ),
            count: imageUrls.length,
          ),
        ),
      ],
    );
  }
}
