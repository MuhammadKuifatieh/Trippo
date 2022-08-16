import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:trippo/core/widgets/image_setter.dart';
import 'package:trippo/core/widgets/main_button.dart';
import 'package:trippo/core/widgets/main_text_field.dart';
import 'package:trippo/features/plans/data/models/plan/plan_model.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_content_use_case.dart';
import 'package:trippo/features/plans/domain/use_cases/add_plan_use_case.dart';

import '../../../../core/config/app_text_styles.dart';
import '../bloc/bloc/plans_bloc.dart';

class AddPlanContentDialog extends StatefulWidget {
  const AddPlanContentDialog({
    Key? key,
    required this.plansBloc,
    required this.planModel,
    required this.placeId,
  }) : super(key: key);
  final PlansBloc plansBloc;
  final PlanModel planModel;
  final int placeId;

  @override
  State<AddPlanContentDialog> createState() => _AddPlanContentDialogState();
}

class _AddPlanContentDialogState extends State<AddPlanContentDialog> {
  late final TextEditingController dateController;
  late final TextEditingController descriptionController;
  late DateTime selectedDate;
  late Size size;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    selectedDate = DateTime.now();
    dateController.text = DateFormat.yMd().format(selectedDate);
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
                      'Some Details',
                      style: AppTextStyles.styleWeight600(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'When did you visit this place?',
                            style: AppTextStyles.styleWeight600(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: MainTextField(
                              controller: dateController,
                              readOnly: true,
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                );
                                if (date != null) {
                                  selectedDate = date;
                                  dateController.text =
                                      DateFormat.yMd().format(date);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    MainTextField(
                      controller: descriptionController,
                      hintText: 'Tell us more about this place',
                      maxLines: 3,
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
                        widget.plansBloc.add(
                          PlanContentAdded(
                            addPlanContentParams: AddPlanContentParams(
                              comment: descriptionController.text,
                              fullDate:
                                  DateFormat("yyyy-MM-dd").format(selectedDate),
                              placeId: widget.placeId,
                              planId: widget.planModel.id,
                            ),
                          ),
                        );
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
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
