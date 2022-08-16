import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/image_setter.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/features/authentication/domain/use_cases/send_host_request_use_case.dart';
import 'package:trippo/features/profile/presentation/bloc/profile/profile_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_button.dart';

class HostRequestSheet extends StatefulWidget {
  const HostRequestSheet({Key? key}) : super(key: key);

  @override
  State<HostRequestSheet> createState() => _HostRequestSheetState();
}

class _HostRequestSheetState extends State<HostRequestSheet> {
  late Size size;
  late final ProfileBloc profileBloc;
  final ValueNotifier<int?> cityNotifier = ValueNotifier(null);
  String? frontId;
  String? backId;
  int? selectedValue;
  @override
  void initState() {
    super.initState();
    profileBloc = ProfileBloc();
    profileBloc.add(GetAllCities());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listener: (context, state) {
        if (state.sendingRequestStatus == SendingRequestStatus.loading) {
          BotToast.showLoading();
        } else if (state.sendingRequestStatus == SendingRequestStatus.falied) {
          BotToast.closeAllLoading();
          BotToast.showText(
            text:
                'Sending request failed...please check you internet connection',
          );
        } else if (state.sendingRequestStatus == SendingRequestStatus.succ) {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: 'Sending request done successfully',
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state.cities == null) {
          return const LoadingScreen();
        }
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Padding(
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
              ),
              Text(
                "Host Transformation",
                style: AppTextStyles.styleWeight600(
                  fontSize: size.width * .05,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageSetter(
                          onChange: (image) {
                            backId = image;
                          },
                          height: size.width * 0.45,
                          width: size.width * 0.45,
                        ),
                        Text('Id Back Side')
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageSetter(
                          onChange: (image) {
                            frontId = image;
                          },
                          height: size.width * 0.45,
                          width: size.width * 0.45,
                        ),
                        Text('Id Front Side')
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<int?>(
                  valueListenable: cityNotifier,
                  builder: (context, value, _) {
                    return DropdownButton<int>(
                      items: state.cities!.map<DropdownMenuItem<int>>((city) {
                        return DropdownMenuItem(
                          child: Text(city.name!),
                          value: city.id,
                        );
                      }).toList(),
                      onChanged: (va) {
                        cityNotifier.value = va;
                      },
                      value: value,
                      hint: Text('Choose City'),
                    );
                  }),
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Center(
                  child: MainButton(
                    child: Text(
                      'Send',
                      style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .05,
                        color: Colors.white,
                      ),
                    ),
                    height: size.width * .1,
                    width: size.width * .25,
                    color: Theme.of(context).primaryColor,
                    onTap: () {
                      if (cityNotifier.value == null ||
                          backId == null ||
                          frontId == null) {
                        BotToast.showText(
                            text: 'Please Fill All The Fields First');
                        return;
                      }
                      profileBloc.add(HostRequestSended(SendHostParams(
                        cityId: cityNotifier.value!,
                        idBack: backId!,
                        idFront: frontId!,
                      )));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
