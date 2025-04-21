import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String? userId;
  String? accessToken;
  String? errorMessage;

  Future<void> loginUser() async {
    final String phone = _phoneController.text.trim();

    final url = Uri.parse('https://your-api.com/api/login'); // 🔁 Replace with your API endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final body = response.body;

        try {
          final data = jsonDecode(body);

          setState(() {
            userId = data['user_id']?.toString();
            accessToken = data['access_token'];
            errorMessage = null;
          });

          print('User ID: $userId');
          print('Access Token: $accessToken');
        } catch (e) {
          setState(() {
            errorMessage = 'Invalid JSON response';
            userId = null;
            accessToken = null;
          });
          print('Error: $e');
        }
      } else {
        setState(() {
          errorMessage = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Network error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: "Enter phone number"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loginUser,
              child: const Text("Login"),
            ),
            const SizedBox(height: 24),
            if (userId != null && accessToken != null) ...[
              Text("User ID: $userId"),
              Text("Access Token: $accessToken"),
            ] else if (errorMessage != null) ...[
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ]
          ],
        ),
      ),
    );
  }
}

