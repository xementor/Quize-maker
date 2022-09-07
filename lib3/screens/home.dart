import 'package:flutter/material.dart';
import '../shared/shared.dart';
import 'screens.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoaderScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('hi'),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
