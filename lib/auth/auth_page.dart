import 'package:budget_tracker_app/pages/signup.dart';
import 'package:budget_tracker_app/pages/login.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially, show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreens);
    } else {
      return SignupPage(showLoginPage: toggleScreens);
    }
  }
}
