import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'temperature_data_screen.dart'; // Importing the TemperatureDataScreen

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late MqttServerClient mqttClient;
  String temperature = 'N/A';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize MQTT client
    mqttClient =
        MqttServerClient('20.189.109.193', 'monitoringapp1.azure-devices.net');
    mqttClient.logging(on: true);
  }

  Future<void> connectToIoTHub() async {
    setState(() {
      isLoading = true;
    });

    try {
      mqttClient.useWebSocket = false;
      mqttClient.port = 8883;

      // Connect to Azure IoT Hub
      await mqttClient.connect('mydevice',
          'HostName=monitoringapp1.azure-devices.net;DeviceId=mydevice;SharedAccessKey=vQcBH8Zj2ogdY8oSm2pScGeucptn24YMTAIoTPFo5tg=');

      // Subscribe to temperature topic
      mqttClient.subscribe(
          'devices/mydevice/messages/events/temperature', MqttQos.atMostOnce);

      // Listen for incoming messages
      mqttClient.updates
          ?.listen((List<MqttReceivedMessage<MqttMessage>>? event) {
        final MqttPublishMessage? message =
            event![0].payload as MqttPublishMessage?;
        final String? payload = message?.payload.message.toString();
        setState(() {
          temperature = payload ?? 'N/A';
          isLoading = false; // Set loading to false when data is received
        });
      });
    } catch (e) {
      // Handle connection errors
      print('Error connecting to IoT Hub: $e');
      // Provide feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to connect to IoT Hub: $e'),
        duration: Duration(seconds: 3),
      ));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 153, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 153, 184),
        title: Text('Temperature'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? CircularProgressIndicator()
                : Text(
                    'Temperature: $temperature',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Connect to IoT Hub when button is pressed
                connectToIoTHub();
              },
              child: Text('Start Sensing'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the TemperatureDataScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TemperatureDataScreen()),
                );
              },
              child: Text('View Data'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    mqttClient.disconnect();
    super.dispose();
  }
}
