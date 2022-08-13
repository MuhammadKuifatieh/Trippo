import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/widgets/cache_image.dart';

class ExperinecesScreen extends StatefulWidget {
  static const String routeName = "experience_screen";
  const ExperinecesScreen({Key? key}) : super(key: key);

  @override
  State<ExperinecesScreen> createState() => _ExperinecesScreenState();
}

class _ExperinecesScreenState extends State<ExperinecesScreen> {
  late final Size size;
  PageController pageController = PageController();
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    changeIndex();
    super.didChangeDependencies();
  }

  ValueNotifier<int> index = ValueNotifier(0);
  changeIndex() {
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      index.value = (index.value != 2) ? index.value + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //pageController.animateToPage(
    // 0,
    //curve: Curves.decelerate,
    //   duration: Duration(milliseconds: 300),
//);
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          ValueListenableBuilder<int>(
              valueListenable: index,
              builder: (context, indexValue, _) {
                return Stack(
                  children: [
                    AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          child: child,
                          opacity: animation,
                          alwaysIncludeSemantics: true,
                        );
                      },
                      duration: Duration(milliseconds: 500),
                      child: (indexValue == 0)
                          ? CacheImage(
                              key: Key("0"),
                              width: size.width,
                              height: size.height,
                              imageUrl:
                                  "https://www.flutterbeads.com/wp-content/uploads/2021/12/change-drawer-icon-color-size-hero.png",
                            )
                          : (indexValue == 1)
                              ? CacheImage(
                                  key: Key("1"),
                                  width: size.width,
                                  height: size.height,
                                  imageUrl:
                                      "https://images-na.ssl-images-amazon.com/images/I/61c4l8bowVL.jpg",
                                )
                              : CacheImage(
                                  key: Key("2"),
                                  width: size.width,
                                  height: size.height,
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz6Dmi3BchDcEOz8nBj79jR1IoGJdyAlrK3g&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                    ),
                    PositionedDirectional(
                      bottom: size.width * .025,
                      start: size.width * .025,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CacheImage(
                            imageUrl:
                                'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
                            height: size.width * .2,
                            width: size.width * .2,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: size.width * .02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Syria, Aleppo',
                                style: AppTextStyles.styleWeight400(
                                  color: Colors.white,
                                  fontSize: size.width * .05,
                                ),
                              ),
                              Text(
                                'From 20\$ /preson',
                                style: AppTextStyles.styleWeight400(
                                  color: Colors.white,
                                  fontSize: size.width * .05,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
          PageView(
            controller: pageController,
            children: [
              CacheImage(
                width: size.width,
                height: size.height,
                imageUrl:
                    "https://www.flutterbeads.com/wp-content/uploads/2021/12/change-drawer-icon-color-size-hero.png",
              ),
              CacheImage(
                width: size.width,
                height: size.height,
                imageUrl:
                    "https://images-na.ssl-images-amazon.com/images/I/61c4l8bowVL.jpg",
              ),
              CacheImage(
                width: size.width,
                height: size.height,
                imageUrl:
                    "https://www.flutterbeads.com/wp-content/uploads/2021/12/change-drawer-icon-color-size-hero.png",
              ),
            ],
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
