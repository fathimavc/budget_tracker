import 'package:flutter/material.dart';
import 'package:budget_tracker_app/widgets/buttons.dart';
import 'package:budget_tracker_app/theme/colors.dart';
import 'package:budget_tracker_app/pages/profile.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
          },
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            ),
        ),
        title: const Text(
          'Add Income',
          style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: decoration('Title'),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: decoration('Amount'),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: () {},
                child: Buttons(text: 'Save'),
              ),
            ),
          ],
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