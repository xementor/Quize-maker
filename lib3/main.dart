import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';
import 'shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Error screen
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider(
              create: (_) => FirestoreService().streamReport(),
              catchError: (_, err) => Report(),
              initialData: Report(),
              child: MaterialApp(
                  debugShowCheckedModeBanner: true,
                  routes: appRoutes,
                  theme: appTheme),
            );
          }

          return MaterialApp(home: LoaderScreen());
        });
  }
}

var appTheme = ThemeData(
  fontFamily: 'Nunito',
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
    ),
    bodyText2: TextStyle(fontSize: 16),
    button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
    headline1: TextStyle(fontWeight: FontWeight.bold),
    subtitle1: TextStyle(color: Colors.grey),
  ),
);

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
