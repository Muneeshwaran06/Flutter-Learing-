import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _storage = FlutterSecureStorage();
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    final savedToken = await _storage.read(key: 'token');
    print('Retrieved token from storage: $savedToken');

    if (savedToken == null) {
      setState(() {
        userData = {
          "error": "Token not found. Please login again."
        };
      });
      return;
    }

    final url = Uri.parse('https://dev.positivehealth.app/api/v1/users/get-user');
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $savedToken",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("User Info: $jsonData");

      setState(() {
        userData = jsonData;
      });
    } else {
      print("Failed to fetch user info: ${response.statusCode}");
      setState(() {
        userData = {
          "error": "Failed to fetch user info."
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userData == null
            ? Center(child: CircularProgressIndicator())
            : userData!.containsKey("error")
            ? Text(userData!["error"])
            : buildUserInfo(userData!),
      ),
    );
  }

  Widget buildUserInfo(Map<String, dynamic> data) {
    final user = data['user'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user['avatar'] != null)
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user['avatar']),
            ),
          ),
        SizedBox(height: 20),
        Text("Name: ${user['name']}", style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text("Email: ${user['email']}"),
        SizedBox(height: 8),
        Text("Phone: ${user['phone']}"),
        SizedBox(height: 8),
        Text("Role: ${user['role_name']}"),
        SizedBox(height: 8),
        Text("Created At: ${user['created_at']}"),
      ],
    );
  }
}