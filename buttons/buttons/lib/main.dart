import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("hi hello"),
              TextButton(
                onPressed: () {
                  print("button pressed");
                },
                child: Text("hi hello"),
              ),
              ElevatedButton(
                onPressed: () {
                  print("saved");
                },
                child: Text("clicked"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("Saved");
                },
                child: Text("Outlined"),
              ),
              IconButton(
                onPressed: () {
                  print("icons");
                },
                icon: Icon(Icons.menu),
              ),
              FloatingActionButton(
                onPressed: () {
                  print("Floating");
                },
                child: Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text("Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
