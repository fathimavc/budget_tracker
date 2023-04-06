import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker_app/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_tracker_app/theme/colors.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    ConfirmPasswordController.dispose();
    FirstNameController.dispose();
    LastNameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim(),
      );

      //add user details
      addUserDetails(
        FirstNameController.text.trim(),
        LastNameController.text.trim(),
        EmailController.text.trim(),
        PasswordController.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'password': password,
    });
  }

  bool passwordConfirmed() {
    if (PasswordController.text.trim() ==
        ConfirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  height: 10,
                ),
                const Text(
                  "Create an Account",
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
                    controller: FirstNameController,
                    decoration: decoration('First Name'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: LastNameController,
                    decoration: decoration('Last Name'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  child: TextField(
                    controller: ConfirmPasswordController,
                    decoration: decoration('Confirm Password'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Buttons(text: 'Sign Up'),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I am a member!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        "Login now",
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
