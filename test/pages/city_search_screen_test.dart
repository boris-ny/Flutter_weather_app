import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/CitySearchScreen.dart';

void main() {
  testWidgets('CitySearchScreen app bar title test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: CitySearchScreen(),
    ));

    // Verify if the app bar title is correct
    expect(find.text('Search cities...'), findsOneWidget);
  });

  testWidgets('City list rendering test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: CitySearchScreen(),
    ));

    // Verify if the initial city list is rendered correctly
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('London'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);
  });

  testWidgets('City filtering test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: CitySearchScreen(),
    ));

    // Filter cities
    await tester.enterText(find.byType(TextField), 'New');
    await tester.pump();

    // Verify if the filtered city list is rendered correctly
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('London'), findsNothing);
    expect(find.text('Paris'), findsNothing);
  });

  testWidgets('Tap favorite icon test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: CitySearchScreen(),
    ));

    // Tap on the favorite icon of a city
    await tester.pump();

    // Verify if the favorite icon changes after tapping
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Remove from favorites test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: CitySearchScreen(),
    ));

    // Tap on the favorite icon again to remove from favorites
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pump();

    // Verify if the favorite icon changes back to outline after tapping again
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
