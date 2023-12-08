import 'package:flutter/material.dart';
import 'package:flutter_application_10/homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTM BOT ',
      home: MyHomePage(),
    );
  }
}
