import 'dart:math';

import 'package:flutter/material.dart';

class HumidityDataScreen extends StatelessWidget {
  // Dummy humidity data (replace with actual sensor data later)
  final double humidity = Random().nextDouble() * 100;

  // Generate AI precautions based on the humidity reading
  String generatePrecautions(double humidity) {
    // Optimum humidity for composting environment (example value)
    final double optimumHumidity = 70.0;

    if (humidity < optimumHumidity - 5) {
      return 'Humidity is too low (${humidity.toStringAsFixed(1)}%). '
          'Consider increasing humidity by misting or providing water sources.';
    } else if (humidity > optimumHumidity + 5) {
      return 'Humidity is too high (${humidity.toStringAsFixed(1)}%). '
          'Ensure proper ventilation and reduce moisture sources.';
    } else {
      return 'Humidity is optimal (${humidity.toStringAsFixed(1)}%). '
          'Continue monitoring to maintain ideal conditions.';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate AI precautions based on the current humidity reading
    String precautions = generatePrecautions(humidity);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 153, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 153, 184),
        title: Text('Humidity Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Humidity: ${humidity.toStringAsFixed(1)}%', // Display dummy humidity data
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            Text(
              precautions,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
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
