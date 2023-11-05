import 'package:flutter/material.dart';
import 'package:sky_green/screens/login_screen.dart';
import 'package:sky_green/screens/profile_screen.dart';
import 'package:sky_green/screens/register_screen.dart';

Widget _defaultHome = const ProfileScreen();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skygreen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/profile': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
