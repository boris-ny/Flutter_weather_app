import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group6_alu/pages/dashboard/FavoritesScreen.dart';

void main() {
  testWidgets('Favorites Screen widget UI test', (WidgetTester tester) async {
    // Dummy data for testing
    final List<CityWeatherItem> favoriteCities = [
      CityWeatherItem(cityName: 'City1', temperature: 20),
      CityWeatherItem(cityName: 'City2', temperature: 25),
      CityWeatherItem(cityName: 'City3', temperature: 18),
    ];

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FavoritesScreen(favoriteCities: favoriteCities),
      ),
    ));

    // Verify if the app bar title is correct
    expect(find.text('Favorites'), findsOneWidget);

    // Verify if the correct number of list tiles are present
    expect(find.byType(ListTile), findsNWidgets(3));

    // Verify if the city names and temperatures are displayed correctly
    expect(find.text('City1'), findsOneWidget);
    expect(find.text('20°C'), findsOneWidget);
    expect(find.text('City2'), findsOneWidget);
    expect(find.text('25°C'), findsOneWidget);
    expect(find.text('City3'), findsOneWidget);
    expect(find.text('18°C'), findsOneWidget);
  });
}
