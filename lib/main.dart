import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:budget_tracker_app/theme/colors.dart';
import 'package:budget_tracker_app/auth/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: const MaterialColor(0xFF2C3137, {
          50: Color(0xFF2C3137),
          100: Color(0xFF2C3137),
          200: Color(0xFF2C3137),
          300: Color(0xFF2C3137),
          400: Color(0xFF2C3137),
          500: Color(0xFF2C3137),
          600: Color(0xFF2C3137),
          700: Color(0xFF2C3137),
          800: Color(0xFF2C3137),
          900: Color(0xFF2C3137)
        })).copyWith(background: white),
      ),
      home: const MainPage(),
    );
  }
}
