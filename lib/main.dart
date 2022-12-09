import 'package:flutter/material.dart';
import 'package:introduction/screens/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentation',
      theme: ThemeData.dark(),
      home: Welcome(),
    );
  }
}
