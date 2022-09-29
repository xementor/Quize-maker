import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/topics/drawer.dart';
import '../../services/services.dart';
import 'quiz_form.dart';
import 'quize_list.dart';

class CreateQuizeScreen extends StatelessWidget {
  late Topic topic;
  CreateQuizeScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        body: Column(
          children: [UserQuizList(topic: topic)],
        ),
        floatingActionButton: IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateQuizeForm(
                    topic: topic,
                  ),
                ),
              );
            }),
      );
    });
  }
}
