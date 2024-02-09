import 'dart:math';

import 'package:flutter/material.dart';

class TemperatureDataScreen extends StatelessWidget {
  // Dummy temperature data (replace with actual sensor data later)
  final double temperature = Random().nextDouble() * 100;

  // Optimum temperature for composting environment (example value)
  final double optimumTemperature = 30.0;

  // Generate AI precautions based on the temperature reading
  String generatePrecautions(double temperature) {
    if (temperature < optimumTemperature - 5) {
      return 'Temperature is too low (${temperature.toStringAsFixed(1)}°C). '
          'Ensure proper insulation and consider providing additional heat sources.';
    } else if (temperature > optimumTemperature + 5) {
      return 'Temperature is too high (${temperature.toStringAsFixed(1)}°C). '
          'Consider providing shade, ventilation, or cooling systems to lower the temperature.';
    } else {
      return 'Temperature is optimal (${temperature.toStringAsFixed(1)}°C). '
          'Continue monitoring to maintain ideal conditions.';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate AI precautions based on the current temperature reading
    String precautions = generatePrecautions(temperature);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 153, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 153, 184),
        title: Text('Temperature Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Temperature: ${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            Text(
              precautions,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
