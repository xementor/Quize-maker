import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateTopicId extends StatelessWidget {
  CreateTopicId({super.key});

  final topoic_id_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: topoic_id_controller,
          ),
          TextButton(
            onPressed: () {
              if (topoic_id_controller.text == null &&
                  topoic_id_controller.text.isEmpty) {
              } else {
                Navigator.pushNamed(context, '/createTopic',
                    arguments: topoic_id_controller.text);
              }
            },
            child: const Text('Add topic'),
          ),
        ],
      ),
    );
  }
}
