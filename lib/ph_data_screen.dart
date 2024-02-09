import 'dart:math';

import 'package:flutter/material.dart';

class PhDataScreen extends StatelessWidget {
  // Dummy pH data (replace with actual sensor data later)
  final double phValue = Random().nextDouble() * 14;

  // Generate AI precautions based on the pH reading
  String generatePrecautions(double phValue) {
    // Optimum pH for composting environment (example value)
    final double optimumPh = 7.0;

    if (phValue < 6.5) {
      return 'pH level is too acidic (${phValue.toStringAsFixed(1)}). '
          'Consider adding lime or wood ash to increase pH.';
    } else if (phValue > 7.5) {
      return 'pH level is too alkaline (${phValue.toStringAsFixed(1)}). '
          'Consider adding organic matter like compost or sulfur to decrease pH.';
    } else {
      return 'pH level is optimal (${phValue.toStringAsFixed(1)}). '
          'Continue monitoring to maintain ideal conditions.';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate AI precautions based on the current pH reading
    String precautions = generatePrecautions(phValue);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'pH Data',
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
                  'assets/images/pH-Chart.png'), // Change chart image source
            ),
            SizedBox(height: 30.0),
            Text(
              'pH Value: ${phValue.toStringAsFixed(1)}', // Display dummy pH data
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
