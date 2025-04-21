import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<bool> loginWithPhone(String phoneNumber) async {
    try {
      const apiUrl = 'https://dev.positivehealth.app/api/v1/users/verify';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phoneNumber}),
      );

      debugPrint('Login response: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Assuming the token comes directly like { "token": "abc123" }
        if (responseData['token'] != null) {
          _token = responseData['token'];
          notifyListeners();
          return true;
        } else {
          debugPrint('Token not found in response.');
        }
      } else {
        debugPrint('Login failed with status: ${response.statusCode}');
      }

      return false;
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    }
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}

//   Future<bool> login(String email, String password) async {
//     // Add your authentication logic here
//     if (email == 'test@example.com' && password == 'password') {
//       _token = 'sample_token';
//       notifyListeners();
//       return true;
//     }
//     return false;
//   }
// }
