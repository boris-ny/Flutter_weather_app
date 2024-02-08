import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Add space above the hourly forecast
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Morning
            Column(
              children: [
                Text(
                  'Morning',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text('9 AM'),
                    WeatherIcon(condition: 'Sunny'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('10 AM'),
                    WeatherIcon(condition: 'Cloudy'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('11 AM'),
                    WeatherIcon(condition: 'Rainy'), // Replace with actual weather condition data
                  ],
                ),
              ],
            ),
            // Noon
            Column(
              children: [
                Text(
                  'Noon',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text('12 PM'),
                    WeatherIcon(condition: 'Sunny'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('1 PM'),
                    WeatherIcon(condition: 'Partly Cloudy'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('2 PM'),
                    WeatherIcon(condition: 'Cloudy'), // Replace with actual weather condition data
                  ],
                ),
              ],
            ),
            // Evening
            Column(
              children: [
                Text(
                  'Evening',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text('3 PM'),
                    WeatherIcon(condition: 'Cloudy'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('4 PM'),
                    WeatherIcon(condition: 'Rainy'), // Replace with actual weather condition data
                    SizedBox(height: 10),
                    Text('5 PM'),
                    WeatherIcon(condition: 'Sunny'), // Replace with actual weather condition data
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20), // Add space between evening and forecast
      ],
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String condition;

  WeatherIcon({required this.condition});

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon;
    switch (condition.toLowerCase()) {
      case 'sunny':
        weatherIcon = Icons.wb_sunny;
        break;
      case 'rainy':
        weatherIcon = Icons.grain;
        break;
      case 'cloudy':
        weatherIcon = Icons.cloud;
        break;
      default:
        weatherIcon = Icons.cloud;
    }

    return Row(
      children: [
        Icon(weatherIcon, color: condition.toLowerCase() == 'sunny' ? Colors.orange : null),
        SizedBox(width: 5),
        Text(condition, style: TextStyle(color: condition.toLowerCase() == 'sunny' ? Colors.orange : null)),
      ],
    );
  }
}
