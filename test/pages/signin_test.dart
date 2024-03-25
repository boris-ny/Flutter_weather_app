import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/signin.dart';
import 'package:flutter_group6_alu/pages/dashboard/dashboard.dart';

void main() {
  testWidgets('SignIn widget UI components test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignIn(),
    ));

    // Verify if the UI components are rendered correctly
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);
  });

  testWidgets('SignIn widget valid sign-in test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignIn(),
    ));

    // Enter valid email and password
    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');

    // Tap the sign-in button
    await tester.tap(find.byType(OutlinedButton));
    await tester.pump();

    // Verify if navigation occurs to the dashboard screen
    expect(find.byType(DashBoard), findsOneWidget);
  });

  testWidgets('SignIn widget invalid email test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignIn(),
    ));

    // Enter invalid email and valid password
    await tester.enterText(find.byType(TextFormField).at(0), 'invalidemail');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');

    // Tap the sign-in button
    await tester.tap(find.byType(OutlinedButton));
    await tester.pump();

    // Verify if error message is displayed
    expect(find.text('Invalid email'), findsOneWidget);
  });

  testWidgets('SignIn widget invalid password test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignIn(),
    ));

    // Enter valid email and invalid password
    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'pass');

    // Tap the sign-in button
    await tester.tap(find.byType(OutlinedButton));
    await tester.pump();

    // Verify if error message is displayed
    expect(find.text('Password must be at least 6 characters long'),
        findsOneWidget);
  });
}
