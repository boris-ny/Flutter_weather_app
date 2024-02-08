import 'package:flutter/material.dart';

import 'forecast_list.dart';
import 'hourly_forecast.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WeatherBody(),
    );
  }
}

class WeatherBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Display City Name, Temperature, and Weather Condition
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text(
                'Kigali',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text(
                    '25°C', // Replace with actual temperature data
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sunny', // Replace with actual weather condition data
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  // Add weather icon here
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 60), // Add space between city info and forecast

        // Display Hours of the Day
        Text(
          'Hours of the Day:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 60), // Add space above hours of the day
        HourlyForecast(), // Add HourlyForecast widget to display hours of the day

        SizedBox(height: 60), // Add space between hours of the day and forecast

        // Display Forecast for Multiple Days
        Text(
          'Forecast for the next few days:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10), // Add space above forecast
        // Add widgets to display forecast for multiple days
        ForecastList(), // Add ForecastList widget to display forecast
      ],
    );
  }
}
