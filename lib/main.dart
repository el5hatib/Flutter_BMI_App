import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black38,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 25,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Colors.white,

          ),
          headlineMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          ),
        ),
      ),
      home:  MyHomePage(),
    );
  }
}
