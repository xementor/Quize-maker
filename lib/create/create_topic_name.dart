import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/services/firestore.dart';

import '../services/models.dart';

class CreateTopicId extends StatelessWidget {
  CreateTopicId({super.key});

  final topoic_id_controller = TextEditingController();
  final title_controller = TextEditingController();
  final description_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                icon: Icon(Icons.description), hintText: 'id', labelText: 'id'),
            controller: topoic_id_controller,
          ),
          TextField(
            decoration: const InputDecoration(
                icon: Icon(Icons.title), hintText: 'title', labelText: 'title'),
            controller: title_controller,
          ),
          TextField(
            decoration: const InputDecoration(
                icon: Icon(Icons.description),
                hintText: 'Description',
                labelText: 'Description'),
            controller: description_controller,
          ),
          TextButton(
            onPressed: () {
              Topic topic = Topic(
                description: description_controller.text,
                title: title_controller.text,
                id: topoic_id_controller.text,
              );

              if (topoic_id_controller.text == null &&
                  topoic_id_controller.text.isEmpty &&
                  description_controller.text == null &&
                  title_controller.text == null) {
              } else {
                FirestoreService().createTopic(topic);
                Navigator.pop(context);
              }
            },
            child: const Text('Add topic'),
          ),
        ],
      ),
    );
  }
}
