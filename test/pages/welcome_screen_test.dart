import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing weather image asset', (WidgetTester tester) async {
    // Test code goes here.

    await tester.pumpWidget(const MaterialApp(
      home: WelcomeScreen(),
    ));
    await tester.pump();
    expect(find.image(const AssetImage('assets/images/sky_icon.png')),
        findsOneWidget);
  });
  testWidgets('checking the welcome Screen', (WidgetTester tester) async {
    // Test code goes here.

    await tester.pumpWidget(const MaterialApp(
      home: WelcomeScreen(),
    )); // Widget emailField = TextFormField(
    //   decoration: const InputDecoration(labelText: 'Email'),
    // );
    await tester.pump();
    expect(find.text('SKYCAST'), findsOneWidget);
  });

  testWidgets('Testing sign up button ', (WidgetTester tester) async {
    // Test code goes here.

    await tester.pumpWidget(const MaterialApp(
      home: WelcomeScreen(),
    ));
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Testing Google sign in button', (WidgetTester tester) async {
    // Test code goes here.

    await tester.pumpWidget(const MaterialApp(
      home: WelcomeScreen(),
    ));
    expect(find.image(const AssetImage('assets/google.png')), findsOneWidget);
  });
}
