import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_text_field.dart';
import '../../../home/data/models/cities_response.dart';
import '../../domain/usecases/add_question_use_case.dart';
import '../blocs/city/city_bloc.dart';

class AddQuestionSheet extends StatefulWidget {
  const AddQuestionSheet({
    Key? key,
    required this.cityBloc,
    required this.city,
  }) : super(key: key);
  final CityBloc cityBloc;
  final CityModel city;
  @override
  State<AddQuestionSheet> createState() => _AddQuestionSheetState();
}

class _AddQuestionSheetState extends State<AddQuestionSheet> {
  late final TextEditingController questionController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: widget.cityBloc,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Add a question",
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .05,
              ),
            ),
            const SizedBox(height: 12),
            MainTextField(
              controller: questionController,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Center(
                child: MainButton(
                  child: Text(
                    'Add',
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .05,
                      color: Colors.white,
                    ),
                  ),
                  height: size.width * .1,
                  width: size.width * .25,
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    widget.cityBloc.add(
                      QuestionAdded(
                        AddQuestionParams(
                          cityId: widget.city.id!,
                          text: questionController.text,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
