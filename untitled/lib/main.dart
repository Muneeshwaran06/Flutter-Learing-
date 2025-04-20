import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  TextEditingController textController = TextEditingController();

  String display = "no data";
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text("simple"),
          backgroundColor: Colors.blueAccent,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: TextField(
                //controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter a Task"),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text("click"),
            ),
            //Text(display)
          ],
        ),
      ),
    );
  }
}