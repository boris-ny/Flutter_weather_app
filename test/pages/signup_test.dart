import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing email field', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignUp(),
    ));
    expect(find.byKey(const ValueKey('email')), findsOneWidget);
  });

  testWidgets('Testing password field', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignUp(),
    ));
    expect(find.byKey(const ValueKey('password')), findsOneWidget);
  });

  testWidgets('Testing signup button icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignUp(),
    ));
    expect(find.byIcon(Icons.account_box_rounded), findsOneWidget);
  });
}
