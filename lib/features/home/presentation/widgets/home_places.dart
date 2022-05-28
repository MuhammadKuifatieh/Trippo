part of '../pages/home_screen.dart';

class _HomePlaces extends StatelessWidget {
  const _HomePlaces({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .625,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 8.0),
          child: PlaceTile(size: size, imageUrl: imageUrl),
        ),
      ),
    );
  }
}