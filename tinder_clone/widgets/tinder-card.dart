import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/services.dart';

class TinderCard extends StatelessWidget {
  final User user;
  const TinderCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(user.urlImage),
      )),
      child: Text('hi'),
    );
  }
}
// image: Image.network(user.urlImage),
