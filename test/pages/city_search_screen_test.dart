import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/CitySearchScreen.dart';

void main() {
  testWidgets('CitySearchScreen widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: CitySearchScreen(),
    ));

    // Verify if the app bar title is correct
    expect(find.text('Search cities...'), findsOneWidget);

    // Verify if the initial city list is rendered correctly
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('London'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);

    // Filter cities
    await tester.enterText(find.byType(TextField), 'New');
    await tester.pump();

    // Verify if the filtered city list is rendered correctly
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('London'), findsNothing);
    expect(find.text('Paris'), findsNothing);

    // Tap on the favorite icon of a city
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();

    // Verify if the favorite icon changes after tapping
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Tap on the favorite icon again to remove from favorites
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pump();

    // Verify if the favorite icon changes back to outline after tapping again
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
