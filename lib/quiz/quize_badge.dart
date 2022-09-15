import 'package:flutter/material.dart';

class QuizBadge extends StatelessWidget {
  const QuizBadge({super.key, required quizId, required topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Icon(Icons.circle),
    );
  }
}
