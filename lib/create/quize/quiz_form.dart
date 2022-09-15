import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../services/services.dart';
import 'package:flutter/material.dart';

class CreateQuizeForm extends StatefulWidget {
  Topic topic;
  CreateQuizeForm({super.key, required this.topic});

  @override
  State<CreateQuizeForm> createState() => _CreateQuizeFormState();
}

class _CreateQuizeFormState extends State<CreateQuizeForm> {
  final _formKey = GlobalKey<FormState>();

  final title_controller = TextEditingController();
  final description_controller = TextEditingController();
  final topic_controller = TextEditingController();
  final id_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
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
                      FirestoreService().createTopic(topic, topic_id);
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
