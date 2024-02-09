import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/signin.dart';
import 'package:flutter_group6_alu/pages/signup.dart';
import 'package:flutter_group6_alu/pages/welcome_screen.dart';

import 'CitySearchScreen.dart';
import 'WeatherScreen.dart';

void main() {
  runApp(const DashBoard());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var activeScreen = 'welcome-screen';

  void signupScreen() {
    setState(() {
      activeScreen = 'signup-screen';
    });
  }

  void signinScreen() {
    setState(() {
      activeScreen = 'signin-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget for changing screens with signupScreen Function
    Widget screenWidget = WelcomeScreen(
      startApp: signupScreen,
    );

    if (activeScreen == 'signup-screen') {
      screenWidget = SignUp(
        doSignUp: signinScreen,
      );
    }

    if (activeScreen == 'signin-screen') {
      screenWidget = const SignIn();
    }

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 23, 23, 23),
      ),
      home: Scaffold(
        body: Container(
          child: screenWidget,
        ),
      ),
    );
  }
}
