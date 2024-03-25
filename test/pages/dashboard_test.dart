import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/pages/dashboard/WeatherScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/dashboard.dart';

void main() {
  testWidgets('Dashboard app bar title test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    // Verify if the app bar title is correct
    expect(find.bySemanticsLabel('Home'), findsOneWidget);
  });

  testWidgets('Initial bottom navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    // Verify if the initial selected index is 0
    await tester.pumpAndSettle();
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Tap search icon test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    // Tap on the search icon
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify if the index changes to 1 after tapping the search icon
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('Tap home icon test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    // Tap on the home icon
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify if the index changes back to 0 after tapping the home icon
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });

  testWidgets('Favorites icon visibility test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    await tester.pump();

    // Verify if the favorite icon appears after updating favorites
    expect(find.byWidget(WeatherScreen()), findsOneWidget);
  });

  testWidgets('Tap favorite icon test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashBoard(),
    ));

    await tester.pump();

    // Tap on the favorite icon
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify if the index changes to 2 after tapping the favorite icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.home), findsNothing);
    expect(find.byIcon(Icons.search), findsNothing);
  });
}
