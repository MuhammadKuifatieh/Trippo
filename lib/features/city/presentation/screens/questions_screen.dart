import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippo/core/widgets/loading_screen.dart';
import 'package:trippo/features/city/presentation/blocs/questions/questions_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/question_tile.dart';
import 'package:trippo/features/home/data/models/cities_response.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/main_error_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    Key? key,
    required this.city,
  }) : super(key: key);

  static const routeName = '/questions';
  final CityModel city;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late final QuestionsBloc questionsBloc;
  late final ScrollController _scrollController;
  late Size size;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    questionsBloc = QuestionsBloc();
    questionsBloc.add(QuestionsFetched(widget.city.id!));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => questionsBloc,
      child: BlocListener<QuestionsBloc, QuestionsState>(
        listener: (context, state) {
          if (state.addingDeletingStatus == AddingDeletingStatus.loading) {
            BotToast.showLoading();
          } else if (state.addingDeletingStatus ==
                  AddingDeletingStatus.failure ||
              state.addingDeletingStatus == AddingDeletingStatus.success) {
            BotToast.closeAllLoading();
            BotToast.showText(text: state.notifyMessage);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Questions',
              style: AppTextStyles.styleWeight600(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ).copyWith(height: 1),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AssetSvg(
                  SvgImages.arrowBackward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          body: BlocBuilder<QuestionsBloc, QuestionsState>(
            builder: (context, state) {
              if (state.status == QuestionsStatus.initial ||
                  state.status == QuestionsStatus.loading) {
                return const LoadingScreen();
              } else if (state.status == QuestionsStatus.failure) {
                return MainErrorWidget(
                    size: size,
                    onTapRety: () {
                      questionsBloc.add(QuestionsFetched(widget.city.id!));
                    });
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (index == state.questions.length) {
                    return const LoadingScreen();
                  }
                  return QuestionTile(question: state.questions[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.questions.length
                    : state.questions.length + 1,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                controller: _scrollController,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      questionsBloc.add(QuestionsFetched(widget.city.id!));
    }
  }
}
