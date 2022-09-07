import 'package:flutter/material.dart';
import '../shared/shared.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Topics')),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
