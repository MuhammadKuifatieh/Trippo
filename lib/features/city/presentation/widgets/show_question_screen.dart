import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/features/city/data/models/question/question_model.dart';
import 'package:trippo/features/city/presentation/blocs/questions/questions_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/question_tile.dart';

import '../../../../core/config/app_text_styles.dart';

class ShowQuestionScreen extends StatelessWidget {
  const ShowQuestionScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  static const routeName = '/show-question';
  final ShowQuestionScreenParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: params.questionsBloc,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Questions Show',
            style: AppTextStyles.styleWeight600(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ).copyWith(height: 1),
          ),
        ),
        body: BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: QuestionTile(
                  question: params.questionModel,
                  showAllAnswers: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShowQuestionScreenParams {
  final QuestionsBloc questionsBloc;
  final QuestionModel questionModel;

  ShowQuestionScreenParams({
    required this.questionsBloc,
    required this.questionModel,
  });
}
