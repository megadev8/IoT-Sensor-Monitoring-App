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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Humidity Data',
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
            Image(
              image: AssetImage(
                  'assets/images/Humidity-Chart.png'), // Change chart image source
            ),
            SizedBox(height: 30.0),
            Text(
              'Humidity: ${humidity.toStringAsFixed(1)}%', // Display dummy humidity data
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
