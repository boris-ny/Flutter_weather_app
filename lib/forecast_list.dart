import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy forecast data
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    List<String> conditions = ['Sunny', 'Rainy', 'Cloudy', 'Sunny', 'Partly Cloudy'];
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

  ForecastItem({
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                weatherIcon,
                color: condition.toLowerCase() == 'sunny' ? Colors.orange : null,
              ),
              SizedBox(width: 5),
              Text(
                condition,
                style: TextStyle(
                  color: condition.toLowerCase() == 'sunny' ? Colors.orange : null,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('$temperature°C'),
        ],
      ),
    );
  }
}
