import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/global_functions.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/main_rating_bar.dart';
import '../widgets/review_bottom_sheet.dart';
import '../widgets/review_card.dart';
import '../widgets/review_result_card.dart';
import '../widgets/upload_image_bottom_sheet.dart';
import 'images_screen.dart';
import 'review_screen.dart';

part '../widgets/palce_app_bar.dart';

class PlaceScreen extends StatefulWidget {
  static const String routeName = 'place_screen';
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late SequenceAnimation sequenceAnimation;
  late PageController pageController;
  late ValueNotifier<int> indexValue;
  late ValueNotifier<String?> selectedTypeRatting;
  late Size size;
  List<String> typeRatting = [
    "Business",
    "Couples",
    "Family",
    "Frinds",
    "Solo",
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    indexValue = ValueNotifier(1);
    selectedTypeRatting = ValueNotifier(null);
    pageController.addListener(() {
      indexValue.value = pageController.page!.round() + 1;
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(
            begin: 0,
            end: 1,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "isOpen",
          curve: Curves.easeOut,
        )
        .addAnimatable(
          animatable: Tween<double>(
            begin: 0.0,
            end: 0.8,
          ),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 125),
          tag: "opacity",
          curve: Curves.easeOut,
        )
        .animate(animationController);
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;

    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _PlaceAppBar(
              size: size,
              animationController: animationController,
              sequenceAnimation: sequenceAnimation,
              pageController: pageController,
              indexValue: indexValue,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Very Beutiful Home',
                      style: AppTextStyles.styleWeight900(
                        color: Colors.black,
                        fontSize: size.width * .065,
                      ),
                    ),
                    SizedBox(height: size.width * .015),
                    Row(
                      children: [
                        MainRatingBar(
                          circleSize: size.width * .045,
                        ),
                        Text(
                          '56,645',
                          style: AppTextStyles.styleWeight300(
                            color: Colors.black,
                            fontSize: size.width * .045,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.width * .015),
                    Text(
                      ' This place is very beautiful, comfortable and very attractive. It contains a lot of entertaining places This place is very beautiful, comfortable and very attractive. It contains a lot of entertaining places',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .03),
                    Row(
                      children: [
                        MainButton(
                          onTap: () {},
                          width: size.width * .4,
                          height: size.width * .1,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Visit webset',
                                style: AppTextStyles.styleWeight400(
                                  color: Colors.white,
                                  fontSize: size.width * .035,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              Icon(
                                Icons.travel_explore_sharp,
                                color: Colors.white,
                                size: size.width * .05,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            MainButton(
                              onTap: () {},
                              width: size.width * .15,
                              height: size.width * .1,
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                                size: size.width * .05,
                              ),
                            ),
                            SizedBox(width: size.width * .025),
                            MainButton(
                              onTap: () {},
                              width: size.width * .15,
                              height: size.width * .1,
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: size.width * .05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * .03),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Admission tickets',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .045,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'from \$46.16',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .045,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'All you need to step foot in the door',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Center(
                      child: MainButton(
                        width: size.width * .8,
                        height: size.width * .1,
                        onTap: () {},
                        child: Text(
                          'See tickets',
                          style: AppTextStyles.styleWeight400(
                            color: Colors.white,
                            fontSize: size.width * .045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * .1),
                    Row(
                      children: [
                        Text(
                          'Tour & expperinces',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .045,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'from \$3.22',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .045,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Explore defferent ways to experience this place',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Center(
                      child: MainButton(
                        width: size.width * .8,
                        height: size.width * .1,
                        onTap: () {},
                        color: Colors.white,
                        border: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'See options',
                          style: AppTextStyles.styleWeight400(
                            color: Theme.of(context).primaryColor,
                            fontSize: size.width * .045,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .04),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Closed Now',
                          style: AppTextStyles.styleWeight600(
                            fontSize: size.width * .04,
                          ),
                        ),
                        Text(
                          '8:00 AM-6:00 PM',
                          style: AppTextStyles.styleWeight400(
                            fontSize: size.width * .04,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      GlobalFunctions().isRTLDirectionality(context)
                          ? Icons.keyboard_arrow_left_rounded
                          : Icons.keyboard_arrow_right_rounded,
                      size: size.width * .1,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
              // SizedBox(height: size.width * .025),
              Padding(
                padding: EdgeInsets.all(size.width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    Text(
                      'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla ',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    Text(
                      'Aoards',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    Row(
                      children: [
                        CacheImage(
                          width: size.width * 0.15,
                          height: size.width * 0.15,
                          imageUrl:
                              'https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg',
                          shape: BoxShape.circle,
                        ),
                        SizedBox(width: size.width * .025),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Travelers Choice',
                              style: AppTextStyles.styleWeight500(
                                fontSize: size.width * .04,
                              ),
                            ),
                            SizedBox(height: size.width * .01),
                            Text(
                              '2021',
                              style: AppTextStyles.styleWeight400(
                                fontSize: size.width * .04,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: size.width * .04),
                    Text(
                      'Suggested duration',
                      style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .04,
                      ),
                    ),
                    Text(
                      '2-3 hours',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .1),
                    Text(
                      'The area',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Text(
                      'Address',
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .0425,
                      ),
                    ),
                    SizedBox(height: size.width * .01),
                    Text(
                      'Carrer de Mallorca, 401, 08013 Barcelona Spain',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Text(
                      'How to get there',
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .0425,
                      ),
                    ),
                    SizedBox(height: size.width * .01),
                    Text(
                      'Passeig de Gracia . 4 min walk',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    Text(
                      'Provence . 8 min walk',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Text(
                      'Neighborhood:',
                      style: AppTextStyles.styleWeight600(
                        fontSize: size.width * .0425,
                      ),
                    ),
                    SizedBox(height: size.width * .01),
                    Text(
                      'pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla pla',
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .04,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    SizedBox(
                      width: size.width,
                      height: size.width * .5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GoogleMap(
                          zoomGesturesEnabled: false,
                          onMapCreated: (controller) async {
                            String mapStyle =
                                await DefaultAssetBundle.of(context)
                                    .loadString("assets/map_style.json");
                            controller.setMapStyle(mapStyle);
                          },
                          markers: {
                            Marker(
                                markerId: MarkerId(
                                  LatLng(47.693436, -122.275953).toString(),
                                ),
                                position: LatLng(47.693436, -122.275953),
                                infoWindow: InfoWindow(
                                  title: "very beutiful home",
                                  snippet: 'is so nice',
                                ))
                          },
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(47.693436, -122.275953),
                            zoom: 12,
                          ),
                          zoomControlsEnabled: false,
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Text(
                      'Resturant nearby',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    SizedBox(
                      height: size.width * .65,
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .5,
                          mainAxisSpacing: size.width * .05,
                          crossAxisSpacing: size.width * .05,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Row(
                          children: [
                            CacheImage(
                              width: size.width * .3,
                              height: size.width * .3,
                              borderRadius: BorderRadius.circular(15),
                              imageUrl:
                                  'https://avatars.mds.yandex.net/i?id=84dbd50839c3d640ebfc0de20994c30d-4473719-images-taas-consumers&n=27&h=480&w=480',
                            ),
                            SizedBox(width: size.width * .02),
                            SizedBox(
                              width: size.width * .275,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.width * .025),
                                  Text(
                                    'Kimchi Mama',
                                    style: AppTextStyles.styleWeight400(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                  SizedBox(height: size.width * .025),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const MainRatingBar(),
                                      Text(
                                        '555',
                                        style: AppTextStyles.styleWeight400(
                                          fontSize: size.width * .035,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: size.width * .025),
                                  Flexible(
                                    child: Text(
                                      'data data data data data data data data data data data data ',
                                      style: AppTextStyles.styleWeight400(
                                        fontSize: size.width * .035,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.width * .015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contribute',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    SizedBox(height: size.width * .015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MainButton(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              constraints: BoxConstraints(
                                maxHeight: size.height * .9,
                                minHeight: size.height * .8,
                              ),
                              builder: (_) => ReviewBottomSheet(
                                size: size,
                                selectedTypeRatting: selectedTypeRatting,
                                typeRatting: typeRatting,
                              ),
                            );
                          },
                          color: Colors.white,
                          border:
                              BorderSide(color: Theme.of(context).primaryColor),
                          width: size.width * .35,
                          height: size.width * .1,
                          child: Text(
                            "Write a reiview",
                            style: AppTextStyles.styleWeight500(
                              fontSize: size.width * .0425,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        MainButton(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              constraints:
                                  BoxConstraints(maxHeight: size.width * .75),
                              builder: (_) =>
                                  UploadImageBottomSheet(size: size),
                            );
                          },
                          color: Colors.white,
                          border:
                              BorderSide(color: Theme.of(context).primaryColor),
                          width: size.width * .35,
                          height: size.width * .1,
                          child: Text(
                            'Upload a photo',
                            style: AppTextStyles.styleWeight500(
                              fontSize: size.width * .0425,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: .5,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: size.width * .025),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Review',
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .05,
                      ),
                    ),
                    SizedBox(height: size.width * .025),
                    Row(
                      children: [
                        MainRatingBar(
                          circleSize: size.width * .045,
                        ),
                        SizedBox(width: size.width * .025),
                        Text(
                          '${654} Reiview',
                          style: AppTextStyles.styleWeight400(
                            color: Colors.grey,
                            fontSize: size.width * .04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.width * .025),
                    ReviewResultCard(size: size),
                  ],
                ),
              ),
              SizedBox(height: size.height * .025),
              Column(
                children: List.generate(
                  5,
                  (index) => ReviewCard(size: size),
                ),
              ),
              SizedBox(height: size.width * .05),
              Center(
                child: MainButton(
                  child: Text(
                    'View All Review',
                    style: AppTextStyles.styleWeight600(
                        color: Theme.of(context).primaryColor,
                        fontSize: size.width * .04),
                  ),
                  color: Colors.white,
                  border: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                  height: size.width * .1,
                  width: size.width * .4,
                  onTap: () {
                    Navigator.of(context).pushNamed(ReviewsScreen.routeName);
                  },
                ),
              ),
              SizedBox(height: size.width * .05),
            ],
          ),
        ),
      ),
    );
  }
}
