import 'package:flutter/material.dart';
import 'package:medicine_shop/create/question/create_question.dart';
import 'package:medicine_shop/create/question/question.dart';
import 'package:medicine_shop/widgets/home.dart';
import 'package:provider/provider.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';
import '../../quiz/quize_badge.dart';

class UserQuizList extends StatelessWidget {
  final Topic topic;
  const UserQuizList({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quiz>>(
      future: FirestoreService().getQuizzes(topic.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData && snapshot.hasError) {
          return const Loader();
        } else {
          var data = snapshot.data!;
          return Column(
            children: data.map(
              (quiz) {
                return Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  elevation: 4,
                  margin: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              // QuizScreen(quizId: quiz.id),
                              QuestionHolder(quiz: quiz),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          quiz.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          quiz.description,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        leading: QuizBadge(topic: topic, quizId: quiz.id),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        }
      },
    );
  }
}
