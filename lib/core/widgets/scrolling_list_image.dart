import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import 'cache_image.dart';

class ScrollingListImage extends StatelessWidget {
  ScrollingListImage({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.images,
  }) : super(key: key);

  final Size size;
  final double height;
  final double width;
  final List<ImageModel> images;
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
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CacheImage(
                    imageUrl: images[index].url!,
                    hash: images[index].hash,
                    width: size.width * .9,
                    height: size.width * .6,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                );
              }),
        ),
        PositionedDirectional(
          bottom: 15,
          start: 15,
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
            count: images.length,
          ),
        ),
      ],
    );
  }
}
