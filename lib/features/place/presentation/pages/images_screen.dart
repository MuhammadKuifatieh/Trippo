import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trippo/features/place/presentation/bloc/place/place_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';

class PlaceImagesScreen extends StatefulWidget {
  static const String routeName = 'place_Images_screen';
  const PlaceImagesScreen({Key? key, required this.arg}) : super(key: key);
  final PlaceImagesScreenParams arg;
  @override
  State<PlaceImagesScreen> createState() => _PlaceImagesScreenState();
}

class _PlaceImagesScreenState extends State<PlaceImagesScreen> {
  late Size size;
  late PlaceBloc placeBloc;
  @override
  void initState() {
    placeBloc = widget.arg.placeBloc
      ..add(GetPlaceImagesEvent(id: widget.arg.id));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: placeBloc,
      child: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Place Image",
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .05,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              centerTitle: true,
            ),
            body: StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(size.width * .025),
              crossAxisCount: 3,
              mainAxisSpacing: size.width * .025,
              crossAxisSpacing: size.width * .025,
              itemCount: state.images.length,
              itemBuilder: (context, index) => CacheImage(
                isPushed: true,
                width: (index % 4 == 0 || index % 4 == 3)
                    ? size.width * .7
                    : size.width * .35,
                height: size.width * .35,
                imageUrl: state.images[index].url!,
                hash: state.images[index].hash,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(15),
              ),
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                (index % 4 == 0 || index % 4 == 3) ? 2 : 1,
                size.width * .35,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceImagesScreenParams {
  final PlaceBloc placeBloc;
  final String id;
  PlaceImagesScreenParams({
    required this.placeBloc,
    required this.id,
  });
}
