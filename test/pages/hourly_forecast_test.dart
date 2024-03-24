import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/hourly_forecast.dart';

void main() {
  testWidgets('Hourly Forecast widget UI test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: HourlyForecast(),
    ));

    // Verify if the Morning, Noon, and Evening texts are present
    expect(find.text('Morning'), findsOneWidget);
    expect(find.text('Noon'), findsOneWidget);
    expect(find.text('Evening'), findsOneWidget);

    // Verify if the weather icons and text for different times are present
    expect(find.byIcon(Icons.wb_sunny), findsNWidgets(2));
    expect(find.byIcon(Icons.grain), findsOneWidget);
    expect(find.byIcon(Icons.cloud), findsNWidgets(3));

    expect(find.text('9 AM'), findsOneWidget);
    expect(find.text('10 AM'), findsOneWidget);
    expect(find.text('11 AM'), findsOneWidget);
    expect(find.text('12 PM'), findsOneWidget);
    expect(find.text('1 PM'), findsOneWidget);
    expect(find.text('2 PM'), findsOneWidget);
    expect(find.text('3 PM'), findsOneWidget);
    expect(find.text('4 PM'), findsOneWidget);
    expect(find.text('5 PM'), findsOneWidget);
  });
}
