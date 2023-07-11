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
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
              background: Colors.black,
              primary: const Color(0xff8E228E),
              onPrimary: Colors.white)),
      home: const HomeScreen(),
    );
  }
}
