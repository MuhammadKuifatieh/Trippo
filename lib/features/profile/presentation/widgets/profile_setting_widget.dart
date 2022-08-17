part of '../pages/setting_screen.dart';

class _ProfileSettingsWidget extends StatelessWidget {
  _ProfileSettingsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  final ValueNotifier<bool> notification = ValueNotifier(true);
  final ValueNotifier<bool> refresh = ValueNotifier(false);
  final pref = serviceLocator<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.profileSetting,
          style: AppTextStyles.styleWeight600(
            fontSize: size.width * .045,
            color: Theme.of(context).primaryColor,
          ),
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {
            Navigator.pushNamed(context, EditProfileScreen.routeName);
          },
          title: AppLocalizations.of(context)!.editProfile,
        ),
        TextButtonProfile(
          size: size,
          onPressed: () {},
          title: AppLocalizations.of(context)!.changePassword,
        ),
        ValueListenableBuilder<bool>(
            valueListenable: notification,
            builder: (context, value, _) {
              return TextButtonProfile(
                size: size,
                title: AppLocalizations.of(context)!.sendPushNotifcation,
                onPressed: () {
                  notification.value = !value;
                },
                child: CupertinoSwitch(
                  value: value,
                  onChanged: (value) {
                    notification.value = value;
                  },
                ),
              );
            }),
            TextButtonProfile(
                size: size,
                title: 'Logout',
                onPressed: () {
                     showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                constraints: BoxConstraints(maxHeight: size.width * .50,),
                builder: (context) => Container(width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
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
                        "Logout",
                        style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .05,
                        ),
                      ),
                      SizedBox(height: 18,),
                      Expanded(
                        child:Text("Are you Sure ?", style: AppTextStyles.styleWeight400(
                          fontSize: size.width * .07,
                        ),)
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal : 8.0,vertical: 24),
                          child: Row(
                            children: [
                          Expanded(
                          child: RoundedExpandedButton(width: 0,
                              child: Text(
                          "Cancel",
                          style: AppTextStyles.styleWeight400(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                                              ),
                                              color: Theme.of(context).primaryColor,
                                              onTap: (){
                                                Navigator.of(context).pop();
                                              },
                          ),
                          ),
                          Expanded(
                          child: RoundedExpandedButton(
                            onTap: ()async{
                              await pref.remove(PrefsKeys.accessToken);
                              await pref.remove(PrefsKeys.userInfo);
                              Navigator.of(context).pushNamedAndRemoveUntil(SplashScreen.routeName, (route) => false);
                            }
                            ,width: 0,
                              child: Text(
                          "OK",
                          style: AppTextStyles.styleWeight400(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                                              ),
                                              color: Theme.of(context).primaryColor,
                          ),
                          )
                            ],
                          ),
                        ),
                       
                    
                    ],
                  ),
                ),
              );
         
                },
                child:const Icon(Icons.logout,size: 28,)
              ),
            
      ],
    );
  }
}
