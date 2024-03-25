import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Morning
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Morning',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Expanded(child: Text('9 AM')),
                        Expanded(child: WeatherIcon(condition: 'Sunny')),
                        SizedBox(height: 10),
                        Expanded(child: Text('10 AM')),
                        Expanded(child: WeatherIcon(condition: 'Cloudy')),
                        SizedBox(height: 10),
                        Expanded(child: Text('11 AM')),
                        Expanded(child: WeatherIcon(condition: 'Rainy')),
                      ],
                    ),
                  ],
                ),
              ),
              // Noon
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Noon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Expanded(child: Text('12 PM')),
                        Expanded(child: WeatherIcon(condition: 'Sunny')),
                        SizedBox(height: 10),
                        Expanded(child: Text('1 PM')),
                        Expanded(
                            child: WeatherIcon(condition: 'Partly Cloudy')),
                        SizedBox(height: 10),
                        Expanded(child: Text('2 PM')),
                        Expanded(child: WeatherIcon(condition: 'Cloudy')),
                      ],
                    ),
                  ],
                ),
              ),
              // Evening
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Evening',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Expanded(child: Text('3 PM')),
                        Expanded(child: WeatherIcon(condition: 'Cloudy')),
                        SizedBox(height: 10),
                        Expanded(child: Text('4 PM')),
                        Expanded(child: WeatherIcon(condition: 'Rainy')),
                        SizedBox(height: 10),
                        Expanded(child: Text('5 PM')),
                        Expanded(child: WeatherIcon(condition: 'Sunny')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20), //
      ],
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String condition;

  const WeatherIcon({super.key, required this.condition});

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
        Icon(weatherIcon,
            color: condition.toLowerCase() == 'sunny' ? Colors.orange : null),
        const SizedBox(width: 5),
        Text(condition,
            style: TextStyle(
                color:
                    condition.toLowerCase() == 'sunny' ? Colors.orange : null)),
      ],
    );
  }
}
