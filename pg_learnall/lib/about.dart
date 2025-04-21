// About Tab Widget
import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _AboutTabState();
}

class _AboutTabState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,


      ),
      // child: Text(
      //   "About Page",
      //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      // ),
    );
  }
}