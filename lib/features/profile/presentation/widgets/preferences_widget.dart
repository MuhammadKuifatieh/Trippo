part of '../pages/setting_screen.dart';

class _PerferencesWidget extends StatelessWidget {
  _PerferencesWidget({
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
        BlocProvider.value(
          value: context.read<LanguageManagerBloc>(),
          child: TextButtonProfile(
            size: size,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                constraints: BoxConstraints(maxHeight: size.width * .75),
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.width * .025,
                          bottom: size.width * .05,
                        ),
                        child: Container(
                          width: size.width * .225,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Text(
                        "Change Language",
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .07,
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<LanguageManagerBloc,
                            LanguageManagerState>(
                          builder: (context, state) {
                            return ListView.builder(
                              itemCount: state.supportedLocalesName.length,
                              itemBuilder: (context, index) => SettingCheckBox(
                                size: size,
                                title: state.supportedLocalesName[index],
                                value: state.locale == supportedLocales[index],
                                onChanged: (value) {
                                  if (state.locale.languageCode ==
                                      supportedLocales[index].languageCode) {
                                    return;
                                  }
                                  context.read<LanguageManagerBloc>().add(
                                        ChangeLanguageEvent(
                                          newLocale: supportedLocales[index],
                                        ),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
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
                      context
                                  .read<LanguageManagerBloc>()
                                  .state
                                  .locale
                                  .languageCode ==
                              'ar'
                          ? "العربية"
                          : 'English(united Kingdom)',
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
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              constraints: BoxConstraints(maxHeight: size.width * .75),
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * .025,
                        bottom: size.width * .05,
                      ),
                      child: Container(
                        width: size.width * .225,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Text(
                      "Change Currency",
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .07,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SettingCheckBox(
                            size: size,
                            title: 'Syrian Pound',
                            value: true,
                            onChanged: (value) {},
                          ),
                          SettingCheckBox(
                            size: size,
                            title: 'Britsh Pound',
                            value: false,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              constraints: BoxConstraints(maxHeight: size.width * .75),
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * .025,
                        bottom: size.width * .05,
                      ),
                      child: Container(
                        width: size.width * .225,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Text(
                      "Change Currency",
                      style: AppTextStyles.styleWeight400(
                        fontSize: size.width * .07,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SettingCheckBox(
                            size: size,
                            title: 'Kilometer/Meter',
                            value: true,
                            onChanged: (value) {},
                          ),
                          SettingCheckBox(
                            size: size,
                            title: 'Inche',
                            value: false,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
