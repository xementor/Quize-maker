import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/topics/drawer.dart';
import '../../services/services.dart';
import 'quiz_form.dart';

class CreateQuizeScreen extends StatelessWidget {
  late Topic topic;
  CreateQuizeScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [QuizList(topic: topic)],
      ),
      floatingActionButton: IconButton(
          icon: const Icon(Icons.add_circle),
          onPressed: () {
            CreateQuizeForm(topic: topic);
          }),
    );
  }
}
