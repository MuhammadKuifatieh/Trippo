part of '../pages/setting_screen.dart';

class _PerferencesWidget extends StatelessWidget {
  const _PerferencesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.preferences,
          style: AppTextStyles.styleWeight600(
            fontSize: size.width * .045,
            color: Theme.of(context).primaryColor,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * .1),
                  child: Column(children: [
                    Text(
                      "Change Language",
                      style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .075,
                      ),
                    ),
                    Expanded(
                      child: ReorderableListView(
                        children: [
                          Center(
                            key: Key('1'),
                            child: SizedBox(
                              width: double.infinity,
                              height: size.width * .2,
                              child: Card(
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.english,
                                    ),
                                    Icon(Icons.unfold_more_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            key: Key('2'),
                            child: SizedBox(
                              width: double.infinity,
                              height: size.width * .2,
                              child: Card(
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.arabic,
                                    ),
                                    Icon(Icons.unfold_more_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        onReorder: (i, j) {},
                      ),
                    )
                  ]),
                ),
              ),
            );
          },
          title: AppLocalizations.of(context)!.language,
          child: SizedBox(
            width: size.width * .275,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'English(united Kingdom)',
                    maxLines: 2,
                    style: AppTextStyles.styleWeight300(
                      color: Colors.black,
                      fontSize: size.width * .032,
                    ),
                  ),
                ),
                Icon(
                  GlobalFunction().isRTLDirectionality(context)
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: size.width * .075,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.currency,
          child: SizedBox(
            width: size.width * .275,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'British Pound',
                    maxLines: 2,
                    style: AppTextStyles.styleWeight300(
                      color: Colors.black,
                      fontSize: size.width * .032,
                    ),
                  ),
                ),
                Icon(
                  GlobalFunction().isRTLDirectionality(context)
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: size.width * .075,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.units,
          child: SizedBox(
            width: size.width * .275,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Kilometer / Meter',
                    maxLines: 2,
                    style: AppTextStyles.styleWeight300(
                      color: Colors.black,
                      fontSize: size.width * .032,
                    ),
                  ),
                ),
                Icon(
                  GlobalFunction().isRTLDirectionality(context)
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: size.width * .075,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.clearSavedData,
          child: SvgPicture.asset('assets/svg/trash.svg'),
        ),
      ],
    );
  }
}
