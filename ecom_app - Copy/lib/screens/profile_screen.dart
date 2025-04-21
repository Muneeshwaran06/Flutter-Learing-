import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text("John Doe", style: TextStyle(fontSize: 20)),
            Text("johndoe@example.com", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      ),
    );
  }
}