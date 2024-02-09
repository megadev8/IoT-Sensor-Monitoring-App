import 'package:flutter/material.dart';
import 'package:monitoring_app/humidity.dart';
import 'package:monitoring_app/ph.dart';
import 'package:monitoring_app/temp_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 153, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 153, 184),
        title: Center(
            child: Text(
          'IoT Monitoring App',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IoT",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Choose any option from below to start monitoring:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TemperatureScreen()));
              },
              child: Text('Temperature'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20), // Button padding
              ),
            ),
            SizedBox(height: 20), // Spacer between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HumidityScreen()));
              },
              child: Text('Humidity'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20), // Button padding
              ),
            ),
            SizedBox(height: 20), // Spacer between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhScreen()));
              },
              child: Text('pH'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                primary: Colors.orange, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20), // Button padding
              ),
            ),
          ],
        ),
      ),
    );
  }
}
