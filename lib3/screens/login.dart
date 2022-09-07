import 'package:flutter/material.dart';
import '../shared/shared.dart';
import '../services/services.dart';

class LoginScreen extends StatelessWidget {
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Text(
              'Login to Start',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text('Your Tagline'),
            LoginButton(
              text: 'Login With Google',
              icon: Icons.facebook,
              loginMethod: auth.googleLogin,
              color: Colors.white54,
            ),
            LoginButton(
                color: Colors.lightBlue,
                icon: Icons.person,
                text: 'Continue as Guest',
                loginMethod: auth.anonLogin)
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: color,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
