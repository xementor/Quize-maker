import 'package:flutter/material.dart';
import 'package:medicine_shop/login/login.dart';
import 'package:medicine_shop/main.dart';
import 'package:medicine_shop/services/auth.dart';
import '../shared/shared.dart';
import '../topics/topics.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return TopicsScreen();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}
