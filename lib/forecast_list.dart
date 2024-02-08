import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({super.key});
  @override
  Widget build(BuildContext context) {
    // Dummy forecast data
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ];
    List<String> conditions = [
      'Sunny',
      'Rainy',
      'Cloudy',
      'Sunny',
      'Partly Cloudy'
    ];
    List<int> temperatures = [25, 20, 22, 26, 23]; // Celsius

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(days.length, (index) {
          return ForecastItem(
            day: days[index],
            condition: conditions[index],
            temperature: temperatures[index],
          );
        }),
      ),
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day;
  final String condition;
  final int temperature;

  const ForecastItem({
    super.key,
    required this.day,
    required this.condition,
    required this.temperature,
  });

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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                weatherIcon,
                color:
                    condition.toLowerCase() == 'sunny' ? Colors.orange : null,
              ),
              const SizedBox(width: 5),
              Text(
                condition,
                style: TextStyle(
                  color:
                      condition.toLowerCase() == 'sunny' ? Colors.orange : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('$temperature°C'),
        ],
      ),
    );
  }
}
