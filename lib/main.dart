import 'package:flutter/material.dart';
import 'package:sky_green/screens/forget_password_screen.dart';
import 'package:sky_green/screens/friend_list_screen.dart';
import 'package:sky_green/screens/login_screen.dart';
import 'package:sky_green/screens/profile_grid.dart';
import 'package:sky_green/screens/profile_screen.dart';
import 'package:sky_green/screens/register_screen.dart';
import 'package:sky_green/screens/splash_screen.dart';
import 'package:sky_green/screens/updateProfile_screen.dart';
import 'package:sky_green/screens/verification_screen.dart';

Widget _defaultHome = ForgetPasswordScreen();

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
        '/forget': (context) => ForgetPasswordScreen(),
        '/friends': (context) => FriendListScreen(),
        '/grid': (context) => ProfileGrid(),
        '/login': (context) => LoginScreen(),
        '/splash': (context) => SplashScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/updateProfile': (context) => UpdateProfileScreen(),
      },
    );
  }
}
