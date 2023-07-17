import 'package:flutter/material.dart';
import 'package:taxes/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // Main Theme for app

      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
              background: Colors.white,
              primary: const Color(0xff406cc0),
              onPrimary: Colors.black)),

      // Going to Home Page

      home: const HomeScreen(),
    );
  }
}
