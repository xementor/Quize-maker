import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/create/question/create_question.dart';
import 'package:medicine_shop/create/question/question_list.dart';
import 'package:medicine_shop/create/question/question_state.dart';
import 'package:medicine_shop/quiz/quiz.dart';
import 'package:medicine_shop/services/firestore.dart';
import 'package:medicine_shop/services/models.dart';
import 'package:provider/provider.dart';

import '../../shared/loading.dart';

class QuestionHolder extends StatefulWidget {
  late String quizId;
  QuestionHolder({super.key, required this.quizId});

  @override
  State<QuestionHolder> createState() => _QuestionHolderState();
}

class _QuestionHolderState extends State<QuestionHolder> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getUserQuiz(widget.quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuestionState>(context);
          if (!snapshot.hasData || snapshot.hasError) {
            return const Loader();
          } else {
            var quiz = snapshot.data!;
            return Scaffold(
              appBar: AppBar(title: Text('Hi')),
              body: PageView.builder(
                controller: state.controller,
                itemBuilder: (context, index) {
                  if (index >= quiz.questions.length) {
                    return CreateQuestion(quizId: widget.quizId);
                  } else {
                    return QuestionPageScreen(question: quiz.questions[index]);
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
