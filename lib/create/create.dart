import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/services/firestore.dart';
import 'package:medicine_shop/shared/loading.dart';
import 'create_topic_name.dart';
import '../topics/topic_item.dart';
import '../services/services.dart';
import 'created_topic_item.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Topic>>(
        stream: FirestoreService().getUserTopic(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              body: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                children:
                    topics.map((e) => CreatedTopicItem(topic: e)).toList(),
              ),
              floatingActionButton: IconButton(
                icon: const Icon(Icons.add_box_outlined),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CreateTopicId();
                      });
                },
              ),
            );
          } else {
            return const Center(
              child: Text('There is no topics'),
            );
          }
        });
  }
}
