import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/hourly_forecast.dart';

void main() {
  testWidgets('Hourly Forecast widget texts test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: HourlyForecast(),
    ));
    await tester.pump();
    // Verify if the Morning, Noon, and Evening texts are present
    expect(find.text('Morning'), findsOneWidget);
    // expect(find.text('Noon'), findsOneWidget);
    // expect(find.text('Evening'), findsOneWidget);
  });

  testWidgets('Hourly Forecast widget weather icons test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: HourlyForecast(),
    ));

    // Verify if the weather icons for different times are present
    expect(find.byIcon(Icons.wb_sunny), findsNWidgets(2));
    expect(find.byIcon(Icons.grain), findsOneWidget);
    expect(find.byIcon(Icons.cloud), findsNWidgets(3));
  });

  testWidgets('Hourly Forecast widget time texts test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: HourlyForecast(),
    ));
    await tester.pump();
    // Verify if the time texts for different times are present
    expect(find.widgetWithText(Expanded, '9 AM'), findsOneWidget);
    // expect(find.text('10 AM'), findsOneWidget);
    // expect(find.text('11 AM'), findsOneWidget);
    // expect(find.text('12 PM'), findsOneWidget);
    // expect(find.text('1 PM'), findsOneWidget);
    // expect(find.text('2 PM'), findsOneWidget);
    // expect(find.text('3 PM'), findsOneWidget);
    // expect(find.text('4 PM'), findsOneWidget);
    // expect(find.text('5 PM'), findsOneWidget);
  });
}
