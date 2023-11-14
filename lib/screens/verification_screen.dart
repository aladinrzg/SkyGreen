import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sky_green/screens/create_new_password_screen.dart';

class VerificationScreen extends StatelessWidget {
  final String email;
  final List<TextEditingController> codeControllers =
      List.generate(4, (index) => TextEditingController());

  VerificationScreen({required this.email});

  void verifyRecoveryCode(BuildContext context) async {
    final String apiUrl = 'http://10.0.2.2:9090/user/verifyRecoveryCode';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'recoveryCode':
            codeControllers.map((controller) => controller.text).join(),
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNewPasswordScreen(email: email),
        ),
      );
    } else {
      // Handle error, show a snackbar, or any other user feedback
      print('Error verifying recovery code');
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
          "Verification",
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
            Text('Enter the recovery code sent to $email'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: 50,
                  child: TextField(
                    controller: codeControllers[index],
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(counterText: ''),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => verifyRecoveryCode(context),
              child: Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}
