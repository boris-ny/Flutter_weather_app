import 'package:flutter/material.dart';

class CityWeatherItem {
  final String cityName;
  final int temperature;

  CityWeatherItem({required this.cityName, required this.temperature});
}

class FavoritesScreen extends StatelessWidget {
  final List<CityWeatherItem> favoriteCities;

  const FavoritesScreen({Key? key, required this.favoriteCities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteCities.length,
        itemBuilder: (context, index) {
          final city = favoriteCities[index];
          return Container(
            color: Colors.purple, // Set purple background color
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                city.cityName,
                style: TextStyle(color: Colors.white), // Text color white
              ),
              subtitle: Text(
                '${city.temperature}°C',
                style: TextStyle(color: Colors.white), // Text color white
              ),
              trailing: Icon(
                Icons.favorite,
                color: Colors.white, // Icon color white
              ),
            ),
          );
        },
      ),
    );
  }
}
