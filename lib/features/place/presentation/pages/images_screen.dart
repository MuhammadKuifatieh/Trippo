import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';

class ImagesScreen extends StatefulWidget {
  static const String routeName = 'Image_screen';
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
        itemCount: 15,
        itemBuilder: (context, index) => CacheImage(
          width: (index % 4 == 0 || index % 4 == 3)
              ? size.width * .7
              : size.width * .35,
          height: size.width * .35,
          imageUrl:
              'https://images.unsplash.com/photo-1612151855475-877969f4a6cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&w=1000&q=80',
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(15),
        ),
        staggeredTileBuilder: (index) => StaggeredTile.extent(
          (index % 4 == 0 || index % 4 == 3) ? 2 : 1,
          size.width * .35,
        ),
      ),
    );
  }
}
