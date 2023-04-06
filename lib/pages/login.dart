import 'package:budget_tracker_app/widgets/buttons.dart';
import 'package:budget_tracker_app/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker_app/theme/colors.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const LoginPage({Key? key, required this.showSignupPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  Future signIn() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim());

    //pop the loading circle
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Login to your Account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: EmailController,
                    decoration: decoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: PasswordController,
                    decoration: decoration('Password'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Buttons(text: 'Sign In'),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignupPage,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration decoration(String hint) => InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: black),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: hint,
      fillColor: white,
      filled: true);
}
