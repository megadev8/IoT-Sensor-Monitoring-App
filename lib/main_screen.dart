import 'package:flutter/material.dart';
import 'package:monitoring_app/ecobucks.dart';
import 'package:monitoring_app/humidity.dart';
import 'package:monitoring_app/ph.dart';
import 'package:monitoring_app/temp_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/Eco-Zindagi-Logo.png'),
            ),
            SizedBox(height: 20),
            Text(
              "Set your weekly waste to decompose",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.5, // Adjust the aspect ratio here
              children: [
                buildOptionCard(
                  context,
                  'Check Temperature',
                  Colors.blue,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemperatureScreen(),
                      ),
                    );
                  },
                ),
                buildOptionCard(
                  context,
                  'Check Humidity',
                  Colors.green,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HumidityScreen(),
                      ),
                    );
                  },
                ),
                buildOptionCard(
                  context,
                  'Check pH',
                  Colors.orange,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhScreen(),
                      ),
                    );
                  },
                ),
                buildOptionCard(
                  context,
                  'Wallet EcoBucks',
                  Colors.purple,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EcobucksScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(
    BuildContext context,
    String title,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16, // Adjust the font size here
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      color: color,
    );
  }
}
