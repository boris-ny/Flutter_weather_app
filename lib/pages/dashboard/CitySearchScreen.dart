import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});
  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<CityWeatherItem> _cities = [
    const CityWeatherItem(
        cityName: 'New York', weatherCondition: 'Sunny', temperature: 22),
    const CityWeatherItem(
        cityName: 'London', weatherCondition: 'Cloudy', temperature: 18),
    const CityWeatherItem(
        cityName: 'Paris', weatherCondition: 'Rainy', temperature: 15),
    const CityWeatherItem(
        cityName: 'Tokyo', weatherCondition: 'Sunny', temperature: 25),
    const CityWeatherItem(
        cityName: 'Kampala', weatherCondition: 'Sunny', temperature: 25),
    const CityWeatherItem(
        cityName: 'Bujumbura', weatherCondition: 'Sunny', temperature: 35),
    const CityWeatherItem(
        cityName: 'Arizona', weatherCondition: 'Sunny', temperature: 37),
  ];

  List<CityWeatherItem> _filteredCities = [];

  @override
  void initState() {
    super.initState();
    _filteredCities.addAll(_cities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterCities,
          decoration: const InputDecoration(
            hintText: 'Search cities...',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredCities.length,
        itemBuilder: (context, index) {
          return _filteredCities[index];
        },
      ),
    );
  }

  void _filterCities(String searchText) {
    setState(() {
      _filteredCities = _cities
          .where((city) =>
              city.cityName.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
}

class CityWeatherItem extends StatelessWidget {
  final String cityName;
  final String weatherCondition;
  final int temperature;

  const CityWeatherItem({
    super.key,
    required this.cityName,
    required this.weatherCondition,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ClipPath(
        clipper: CityClipper(),
        child: Container(
          color: Colors.purple,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Temperature and City Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$temperature°C',
                      style: const TextStyle(
                          fontSize: 56.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      cityName,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              // Icon
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(
                  _getWeatherIcon(weatherCondition),
                  color: _getWeatherIconColor(weatherCondition),
                  size: 64.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.grain;
      default:
        return Icons.error;
    }
  }

  Color _getWeatherIconColor(String condition) {
    if (condition.toLowerCase() == 'sunny') {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }
}

class CityClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double curveHeight = size.height * 0.5;
    final double curveWidth = size.width * 0.3;
    final double tallerSideWidth = size.width * 0.7;

    path.lineTo(0, size.height);
    path.lineTo(tallerSideWidth, size.height);
    path.lineTo(tallerSideWidth, curveHeight);

    final controlPointX = size.width / 2;
    final controlPointY = curveHeight - curveWidth;

    path.quadraticBezierTo(controlPointX, controlPointY,
        size.width - tallerSideWidth, curveHeight);

    path.lineTo(size.width - tallerSideWidth, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
