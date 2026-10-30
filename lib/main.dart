
import 'package:flutter/material.dart';
import 'screens/inputScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Water Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F9FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const InputScreen(),
    );
  }
}
