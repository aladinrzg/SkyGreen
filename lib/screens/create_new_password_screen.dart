import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateNewPasswordScreen extends StatelessWidget {
  final String email;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  CreateNewPasswordScreen({required this.email});

  void updatePassword(BuildContext context) async {
    final String apiUrl = 'http://10.0.2.2:9090/user/updatePassword';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'newPassword': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Password updated successfully, you may want to navigate to the login screen or any other page
      // For simplicity, we just print a success message here
      print('Password updated successfully');
    } else {
      // Handle error, show a snackbar, or any other user feedback
      print('Error updating password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Create New Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == confirmPasswordController.text) {
                  updatePassword(context);
                } else {
                  // Passwords do not match, show an error message
                  print('Passwords do not match');
                }
              },
              child: Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }
}
