import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/image_setter.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/core/widgets/main_button.dart';
import 'package:trippo/core/widgets/main_text_field.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_use_case.dart';

import '../../../../core/config/app_text_styles.dart';
import '../bloc/bloc/plans_bloc.dart';

class AddPlanDialog extends StatefulWidget {
  const AddPlanDialog({
    Key? key,
    required this.plansBloc,
    required this.cityId,
    required this.cityName,
  }) : super(key: key);
  final PlansBloc plansBloc;
  final int cityId;
  final String cityName;

  @override
  State<AddPlanDialog> createState() => _AddPlanDialogState();
}

class _AddPlanDialogState extends State<AddPlanDialog> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final ValueNotifier<int> cityNotifier = ValueNotifier(1);
  late Size size;
  String? choosenImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.plansBloc,
      child: BlocBuilder<PlansBloc, PlansState>(
        builder: (context, state) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add New Plan To ${widget.cityName}',
                      style: AppTextStyles.styleWeight600(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    MainTextField(
                      controller: nameController,
                      hintText: 'Plane Name',
                    ),
                    const SizedBox(height: 12),
                    MainTextField(
                      controller: descriptionController,
                      hintText: 'Plane Description',
                    ),
                    const SizedBox(height: 12),
                    const SizedBox(height: 12),
                    ImageSetter(
                      onChange: (image) {
                        choosenImage = image;
                      },
                      height: size.width * 0.6,
                      width: size.width * 0.6,
                    ),
                    const SizedBox(height: 12),
                    MainButton(
                      child: Text(
                        'Add',
                        style: AppTextStyles.styleWeight600(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      height: 40,
                      width: 100,
                      onTap: () {
                        widget.plansBloc.add(PlanAdded(AddPlansParams(
                          name: nameController.text,
                          description: descriptionController.text,
                          image: choosenImage,
                          cityId: widget.cityId,
                        )));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
