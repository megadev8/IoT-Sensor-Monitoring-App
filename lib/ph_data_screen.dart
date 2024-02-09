import 'dart:math';

import 'package:flutter/material.dart';

class PhDataScreen extends StatelessWidget {
  // Dummy pH data (replace with actual sensor data later)
  final double phValue = Random().nextDouble() * 100;

  // Generate AI precautions based on the pH reading
  String generatePrecautions(double phValue) {
    // Optimum pH for composting environment (example value)
    final double optimumPh = 6.0;

    if (phValue < optimumPh - 0.5) {
      return 'pH level is too acidic (${phValue.toStringAsFixed(1)}). '
          'Consider adding lime or wood ash to increase pH.';
    } else if (phValue > optimumPh + 0.5) {
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
      backgroundColor: const Color.fromARGB(255, 93, 153, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 153, 184),
        title: Text('pH Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'pH Value: ${phValue.toStringAsFixed(1)}', // Display dummy pH data
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
