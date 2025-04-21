import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> loginUser(String phoneNumber) async {
    final url = Uri.parse('https://dev.positivehealth.app/api/v1/users/verify');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'phone_number': phoneNumber});

    try {
      final response = await http.post(url, headers: headers, body: body);
      print('Login response: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['access_token'] != null && responseData['refresh_token'] != null) {
          final accessToken = responseData['access_token'];
          final refreshToken = responseData['refresh_token'];

          // Save tokens using SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', accessToken);
          await prefs.setString('refresh_token', refreshToken);

          print('Access Token saved: $accessToken');
          print('Refresh Token saved: $refreshToken');
        } else {
          print('Token not found in response.');
        }
      } else {
        print('Login failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
