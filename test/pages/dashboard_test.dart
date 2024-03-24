import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/dashboard.dart';

void main() {
  testWidgets('Dashboard widget UI test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: DashBoard(),
    ));

    // Verify if the app bar title is correct
    expect(find.text('Weather App'), findsOneWidget);

    // Verify if the initial selected index is 0
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.favorite),
        findsNothing); // Favorite icon should not be present initially

    // Tap on the search icon
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify if the index changes to 1 after tapping the search icon
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.home), findsNothing);
    expect(find.byIcon(Icons.favorite),
        findsNothing); // Favorite icon should not be present after tapping search

    // Tap on the home icon
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify if the index changes back to 0 after tapping the home icon
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsNothing);
    expect(find.byIcon(Icons.favorite),
        findsNothing); // Favorite icon should not be present after tapping home

    // Simulate having favorites
    await tester.pumpWidget(MaterialApp(
      home: DashBoard(),
    ));

    final DashBoardState dashboardState = tester.state(find.byType(DashBoard));

    // Update favorites to true
    dashboardState._updateFavorites(true);
    await tester.pump();

    // Verify if the favorite icon appears after updating favorites
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Tap on the favorite icon
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify if the index changes to 2 after tapping the favorite icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.home), findsNothing);
    expect(find.byIcon(Icons.search), findsNothing);
  });
}
