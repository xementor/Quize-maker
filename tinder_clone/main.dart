import 'package:flutter/material.dart';
import 'services/services.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});
  final user = User(
    name: "Katty",
    age: 21,
    urlImage:
        "https://images.unsplash.com/photo-1542513217-0b0eedf7005d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
  );

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: TinderCard(user: widget.user));
  }
}
