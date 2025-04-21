// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'user_info_form.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _phoneController = TextEditingController();
//
//   Future<void> loginUser() async {
//     final String phone = _phoneController.text.trim();
//     final url = Uri.parse('http://34.100.200.43/api/login');
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'phone': phone}),
//       );
//
//       print("API Response Body: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//
//         // Check if token exists in the correct location
//         if (data['data'] != null && data['data']['token'] != null) {
//           String token = data['data']['token'];
//           print("Token received: $token");
//
//           // Save token
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setString('token', token);
//
//           // Navigate to UserInfo page
//           if (!mounted) return;
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UserInfoScreen()),
//           );
//         } else {
//           showError("Login failed: Token missing");
//         }
//       } else {
//         showError("Login failed: ${response.statusCode}");
//       }
//     } catch (e) {
//       showError("Login error: $e");
//     }
//   }
//
//   void showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 24),
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(labelText: 'Phone'),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: loginUser,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shadowColor: Colors.purple),
//               child: const Text('Login', style: TextStyle(color: Colors.purple)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'user_info_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final _storage = FlutterSecureStorage();

  Future<void> loginUser() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Phone number is required")),
      );
      return;
    }

    final url = Uri.parse('https://dev.positivehealth.app/api/v1/users/verify');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone}),
      );

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['access_token'];
        await _storage.write(key: 'token', value: token);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => UserInfoScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loginUser,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shadowColor: Colors.purple),
              child: const Text('Login', style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}