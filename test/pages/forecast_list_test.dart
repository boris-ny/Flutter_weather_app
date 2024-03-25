import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/forecast_list.dart';

void main() {
  testWidgets('Forecast List widget item count test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ForecastList(),
      ),
    ));

    // Verify if the correct number of forecast items are present
    expect(find.byType(ForecastItem), findsNWidgets(5));
  });

  testWidgets('Forecast List widget day text test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ForecastList(),
      ),
    ));

    // Verify if the day texts are displayed correctly
    expect(find.text('Monday'), findsOneWidget);
    expect(find.text('Tuesday'), findsOneWidget);
    expect(find.text('Wednesday'), findsOneWidget);
    expect(find.text('Thursday'), findsOneWidget);
    expect(find.text('Friday'), findsOneWidget);
  });

  testWidgets('Forecast List widget condition text test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ForecastList(),
      ),
    ));

    // Verify if the condition texts are displayed correctly
    expect(find.text('Sunny'), findsNWidgets(2));
    expect(find.text('Rainy'), findsOneWidget);
    expect(find.text('Cloudy'), findsOneWidget);
    expect(find.text('Partly Cloudy'), findsOneWidget);
  });

  testWidgets('Forecast List widget temperature text test',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ForecastList(),
      ),
    ));

    // Verify if the temperature texts are displayed correctly
    expect(find.text('25°C'), findsOneWidget);
    expect(find.text('20°C'), findsOneWidget);
    expect(find.text('22°C'), findsOneWidget);
    expect(find.text('26°C'), findsOneWidget);
    expect(find.text('23°C'), findsOneWidget);
  });
}
