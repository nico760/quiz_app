import 'package:database/screens/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test App'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 238, 226, 117),
        ),
        body: const WelcomePage(),
        ),
      );
  }
}
