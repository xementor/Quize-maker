import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [], //with flutter analytics],

      routes: {
        '/': (context) => LoginScreen(),
        '/topic': (context) => TopicsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/about': (context) => AboutScreen(),
      },

      // Theme:
      theme: ThemeData(
        fontFamily: 'Nunito',
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.black87,
        ),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
          ),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
