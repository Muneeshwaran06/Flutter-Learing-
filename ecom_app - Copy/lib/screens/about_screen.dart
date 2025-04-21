import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home:  Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: const Center(
        child: Text(
          "This is a demo e-commerce app made with Flutter.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
        ),
    );
  }
}