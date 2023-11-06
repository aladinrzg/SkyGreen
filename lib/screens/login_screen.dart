import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: ProgressHUD(
          key: loginFormKey,
          child: Form(
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/longLogo.png",
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          _inputFieldWidget(
            context,
            "username",
            "username or email",
            (value) {
              if (value?.isEmpty ?? true) {
                return "username is required";
              }
              return null;
            },
            (value) {
              username = value;
            },
            prefixIcon: Icon(Icons.person, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _inputFieldWidget(
              context,
              "password",
              "Password",
              (value) {
                if (value?.isEmpty ?? true) {
                  return "the password is required";
                }
                return null;
              },
              (value) {
                password = value;
              },
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'forget password ?',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("forgetPassword");
                            }),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement login logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 50, vertical: 20), // adjusted padding
                minimumSize: Size(200, 60), // minimum width and height
                textStyle: TextStyle(fontSize: 20), // font size of button text
              ),
              child: Text(
                "Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("OR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'dont have an account yet ? ',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      TextSpan(
                          text: 'sign up',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            }),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _inputFieldWidget(
    BuildContext context,
    String label,
    String hint,
    FormFieldValidator<String?> validator,
    FormFieldSetter<String?> onSaved, {
    bool obscureText = false,
    Icon? prefixIcon,
    IconButton? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
