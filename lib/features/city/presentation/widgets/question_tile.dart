import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:trippo/core/widgets/main_text_field.dart';
import 'package:trippo/features/city/domain/usecases/add_answer_use_case.dart';
import 'package:trippo/features/city/presentation/blocs/questions/questions_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/answer_tile.dart';
import 'package:trippo/features/city/presentation/screens/show_question_screen.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../data/models/question/question_model.dart';

class QuestionTile extends StatefulWidget {
  const QuestionTile({
    Key? key,
    required this.question,
    this.showAllAnswers = false,
  }) : super(key: key);
  final QuestionModel question;
  final bool showAllAnswers;

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  late final TextEditingController answerController;

  @override
  void initState() {
    super.initState();
    answerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.showAllAnswers) return;
              Navigator.pushNamed(
                context,
                ShowQuestionScreen.routeName,
                arguments: ShowQuestionScreenParams(
                  questionsBloc: context.read<QuestionsBloc>(),
                  questionModel: widget.question,
                ),
              );
            },
            child: Stack(
              children: [
                Row(
                  children: [
                    CacheImage(
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      imageUrl: testImageUrl,
                      shape: BoxShape.circle,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A7MED SI',
                          style: AppTextStyles.styleWeight500(fontSize: 12),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Machester, UK',
                          style: AppTextStyles.styleWeight400(fontSize: 10),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '10 contributers',
                          style: AppTextStyles.styleWeight400(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 20,
                  top: 0,
                  child: const Icon(Icons.more_vert),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.question.text,
            style: AppTextStyles.styleWeight400(),
          ),
          const SizedBox(height: 8),
          Text(
            '24 Aprit 2022',
            style: AppTextStyles.styleWeight300(fontSize: 10),
          ),
          const SizedBox(height: 12),
          if (widget.question.answers.isNotEmpty)
            Text(
              'Answers',
              style: AppTextStyles.styleWeight600(fontSize: 14),
            ),
          if (widget.question.answers.isEmpty)
            Text(
              'No Answers Yet..',
              style: AppTextStyles.styleWeight600(fontSize: 14),
            ),
          if (widget.question.answers.isNotEmpty) const SizedBox(height: 12),
          if (widget.question.answers.isNotEmpty && !widget.showAllAnswers)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0;
                      i < 2 && i < widget.question.answers.length;
                      i++)
                    AnswerTile(
                      answer: widget.question.answers[i],
                    ),
                ],
              ),
            ),
          if (widget.question.answers.isNotEmpty && widget.showAllAnswers)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.question.answers.length; i++)
                    AnswerTile(
                      answer: widget.question.answers[i],
                    ),
                ],
              ),
            ),
          if (widget.question.answers.length > 2 && !widget.showAllAnswers)
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ShowQuestionScreen.routeName,
                  arguments: ShowQuestionScreenParams(
                    questionsBloc: context.read<QuestionsBloc>(),
                    questionModel: widget.question,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Show All Answers',
                  style: AppTextStyles.styleWeight700(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50,
                    child: MainTextField(
                      controller: answerController,
                      hintText: 'Write answer ...',
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (answerController.text.isEmpty) return;
                      context.read<QuestionsBloc>().add(AnswerAdded(
                          AddAnswerParams(
                              questionId: widget.question.id,
                              text: answerController.text)));
                      answerController.clear();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
