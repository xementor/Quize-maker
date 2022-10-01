import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_shop/create/create_topic.dart';
import '../services/services.dart';
import '../shared/progress_bar.dart';
import '../topics/topic_item.dart';
import 'quize/quize.dart';

class CreatedTopicItem extends StatelessWidget {
  late Topic topic;
  CreatedTopicItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Hero(
        tag: topic.img,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateQuizeScreen(topic: topic)),
              );

              // Navigator.pushNamed(context, '/createTopic', arguments: topic.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/covers/${topic.img}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      topic.title,
                      style: const TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
                topic.isPublished
                    ? Container()
                    : IconButton(
                        onPressed: () {
                          FirestoreService().publishTheTopic(topic);
                          print('added');
                        },
                        icon: Icon(Icons.upload),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
