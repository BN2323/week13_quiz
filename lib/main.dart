import 'package:flutter/material.dart';
import 'package:week13_quiz/ui/groceries/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark(),
      home: const TabsPage(),
    );
  }
}
