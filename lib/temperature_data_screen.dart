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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Temperature Data',
            style: TextStyle(
              fontSize: 34, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/images/Temp-Chart.png')),
            SizedBox(height: 30.0),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Change button color
              ),
              child: Text(
                'Go Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
