import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/services.dart';

class CreateTopic extends StatefulWidget {
  const CreateTopic({super.key});

  @override
  State<CreateTopic> createState() => _CreateTopicState();
}

class _CreateTopicState extends State<CreateTopic> {
  final _formKey = GlobalKey<FormState>();

  final description_controller = TextEditingController();
  final title_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var topic_id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(topic_id),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: title_controller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: 'Title',
                  labelText: 'Title',
                ),
                validator: ((value) {
                  if (value != null && value.isEmpty) {
                    return "Please enter text";
                  }
                  return null;
                }),
              ),
              TextFormField(
                controller: description_controller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                validator: ((value) {
                  if (value != null && value.isEmpty) {
                    return "Please enter text";
                  }
                  return null;
                }),
              ),
              Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: TextButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    Topic topic = Topic(
                      description: description_controller.text,
                      id: topic_id,
                      title: title_controller.text,
                    );

                    if (_formKey.currentState!.validate()) {
                      FirestoreService().createTopic(topic);
                      Navigator.pushNamed(context, '/create');
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
