import 'package:flutter/material.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile')),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
