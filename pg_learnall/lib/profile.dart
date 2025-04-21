
import 'package:flutter/material.dart';

// Profile Tab Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TextButton(onPressed: () {}, child: TextField(
          decoration: InputDecoration(
              labelText: "Enter your name",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90),
            borderSide: BorderSide.none,
          )),

        ),
        ),
        // style: TextStyle(
        //     fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),


      ],
    );

  }
}

