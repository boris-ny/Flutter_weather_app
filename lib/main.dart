import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/dashboard/dashboard.dart';
import 'package:flutter_group6_alu/pages/signin.dart';
import 'package:flutter_group6_alu/pages/signup.dart';
import 'package:flutter_group6_alu/pages/welcome_screen.dart';

void main() {
  runApp(const MainApp());
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

  void dashboardScreen() {
    setState(() {
      activeScreen = 'dashboard';
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget for changing screens with signupScreen Function
    Widget screenWidget = WelcomeScreen(
      startSignUp: signupScreen,
      startSignIn: signinScreen,
    );

    if (activeScreen == 'signup-screen') {
      screenWidget = SignUp(
        doSignUp: signinScreen,
      );
    }

    if (activeScreen == 'signin-screen') {
      screenWidget = SignIn(
        startDashboardScreen: dashboardScreen,
      );
    }

    if (activeScreen == 'dashboard') {
      screenWidget = const DashBoard();
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
