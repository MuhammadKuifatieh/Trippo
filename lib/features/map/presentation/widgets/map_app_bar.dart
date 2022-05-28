part of '../pages/map_screen.dart';

class _MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MapAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: size.height * .1,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.width * .015),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1.25,
                          offset: const Offset(0, .75),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Where are you going?",
                          hintStyle: AppTextStyles.styleWeight400(
                            fontSize: size.width * .04,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * .025,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            TrippoIcons.search,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ),
                ),
                SizedBox(width: size.width * .015),
                Container(
                  padding: EdgeInsets.all(size.width * .025),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1.25,
                        offset: const Offset(0, .75),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(SvgImages.filtter),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * .1);
}
