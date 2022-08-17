import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/images/svg_images.dart';
import 'package:trippo/core/constants/prefs_keys.dart';
import 'package:trippo/core/data/models/user/user.dart';
import 'package:trippo/core/widgets/asset_svg.dart';
import 'package:trippo/core/widgets/rounded_expanded_button.dart';
import 'package:trippo/features/authentication/domain/use_cases/update_profile_use_case.dart';
import 'package:trippo/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:trippo/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:trippo/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'edit_profile_screen';
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController userNameController;
  late TextEditingController aboutController;
  late TextEditingController genderController;
  late TextEditingController phoneNumberController;
  late TextEditingController birthDateController;

  final items = ["Male", "Fmale"];
  int? itemVal;
  String? val;
  late User user;
  late ProfileBloc profileBloc;
  @override
  void initState() {
    profileBloc = ProfileBloc();
    final pref = serviceLocator<SharedPreferences>();
    String getUser = pref.getString(PrefsKeys.userInfo) ?? "";
    user = User.fromJson(jsonDecode(getUser));
    DateTime date = DateTime.now();

    fNameController = TextEditingController(text: user.firstName);
    lNameController = TextEditingController(text: user.lastName);
    userNameController = TextEditingController(text: user.username);
    aboutController = TextEditingController(text: user.about);
    genderController = TextEditingController(text: user.gender);
    phoneNumberController = TextEditingController(text: user.phoneNumber);

    birthDateController = TextEditingController(
        text: user.dateOfBirth != null
            ? DateFormat("dd/MM/yyyy").format(DateTime.parse(user.dateOfBirth!))
            : null);
    val = user.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
            child: Column(
              children: [
                AuthTextField(
                  controller: fNameController,
                  hintText: 'First name',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: lNameController,
                  hintText: 'Last name',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: userNameController,
                  hintText: 'User name',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  readOnly: false,
                  controller: birthDateController,
                  hintText: 'Birth date',
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if (selectedDate == null) return;
                    setState(() {
                      birthDateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                      value: val,
                      buttonPadding: const EdgeInsets.only(
                          left: 14, right: 14, top: 2, bottom: 2),
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Gender"),
                      ),
                      buttonDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                      offset: const Offset(-4, 0),
                      items: items
                          .map(
                            (item) => DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: item,
                                child: Text(item)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          genderController.text = value as String;
                          val = genderController.text;
                        });
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: phoneNumberController,
                  hintText: 'Phone number',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: aboutController,
                  hintText: 'About',
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return RoundedExpandedButton(
                      child: Text(
                        "Update",
                        style: AppTextStyles.styleWeight400(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        profileBloc.add(UpdateProfileEvent(
                                updateProfileParams: UpdateProfileParams(
                              firstName: fNameController.text,
                              lastName: lNameController.text,
                              username: userNameController.text,
                              about: aboutController.text,
                              dateOfBirth: birthDateController.text,
                              gender: genderController.text,
                              id: user.id.toString(),
                              phoneNumber: phoneNumberController.text,
                            )));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? getGenderName(int? num) {
    if (num == 0) {
      return "Male";
    } else if (num == 1) {
      return "Fmale";
    } else {
      return null;
    }
  }

  int getGenderNum(String gender) {
    if (gender == "Male" || gender == "male") {
      return 0;
    } else {
      return 1;
    }
  }
}
