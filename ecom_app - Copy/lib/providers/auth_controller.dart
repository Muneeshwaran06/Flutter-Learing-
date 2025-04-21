import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  static const String baseUrl = "https://dev.positivehealth.app/api/v1/users/verify";

  static Future<void> loginUser({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://your-api.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );

      print("Login response: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Log the parsed keys for debug
        print("Parsed JSON: $data");

        if (data["access_token"] != null) {
          String accessToken = data["access_token"];
          print("Access Token: $accessToken");

          // You can save the token using any state management or local storage here

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login successful!")),
          );
        } else {
          print("Token not found in parsed response.");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Token not found in response.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("Login error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }
}
