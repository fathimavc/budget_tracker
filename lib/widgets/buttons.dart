import 'package:flutter/material.dart';
import 'package:budget_tracker_app/theme/colors.dart';

class Buttons extends StatelessWidget {
  final String text;

   Buttons({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}