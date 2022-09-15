import 'package:medicine_shop/create/create_topic.dart';

import 'widgets/widgets.dart';
import 'topics/topics.dart';
import 'login/login.dart';
import 'about/about.dart';
import 'profile/profile.dart';
import 'create/create.dart';

var appRoutes = {
  '/': (context) => HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/topics': (context) => TopicsScreen(),
  '/profile': (context) => ProfileScreen(),
  '/about': (context) => AboutScreen(),
  '/create': (context) => CreateScreen(),
  '/createTopic': (context) => CreateTopic(),
};
