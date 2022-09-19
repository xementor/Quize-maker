import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:medicine_shop/create/question/question_state.dart';
import 'package:medicine_shop/services/firestore.dart';
import 'package:medicine_shop/services/models.dart';
import 'package:provider/provider.dart';

class CreateQuestion extends StatefulWidget {
  late Quiz quiz;
  CreateQuestion({super.key, required this.quiz});

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final _formKey = GlobalKey<FormState>();

  final title_controller = TextEditingController();
  final description_controller = TextEditingController();
  final topic_controller = TextEditingController();
  final id_controller = TextEditingController();
  int idx = 0;
  int correctOption = 1;
  // final option_controller = TextEditingController();
  List<TextEditingController> options_c = [];

  List<Widget> options = [const Text('Options')];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: title_controller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.title),
                        hintText: 'Text',
                        labelText: 'Question Text',
                      ),
                      validator: ((value) {
                        if (value != null && value.isEmpty) {
                          return "Please enter text";
                        }
                        return null;
                      }),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          options_c.add(TextEditingController());
                          options.add(OptionScreen(idx));

                          idx++;
                        }
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: ((context, index) {
                  return options[index];
                }),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  List<Map<String, dynamic>> options = [];
                  for (var el in options_c) {
                    Map<String, dynamic> option = {
                      'text': el.text,
                      'correct': false,
                      'details': el.text,
                    };
                    options.add(option);
                  }
                  String quiz_id = widget.quiz.id;

                  FirestoreService().addQuestionsToUserQuiz(
                      quiz_id, title_controller.text, options);

                  Provider.of<QuestionState>(context, listen: false).nextPage();
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget OptionScreen(int idx) => Row(
        children: [
          Radio(
            value: idx,
            groupValue: correctOption,
            toggleable: true,
            onChanged: (value) {
              print('... clicked on radio..');
              setState(() {
                correctOption = value as int;
              });
            },
          ),
          Expanded(
            child: TextFormField(
              controller: options_c[idx],
              decoration: const InputDecoration(
                hintText: 'Options',
                labelText: 'Option Text',
              ),
              validator: ((value) {
                if (value != null && value.isEmpty) {
                  return "Please enter text";
                }
                return null;
              }),
            ),
          ),
        ],
      );
}
