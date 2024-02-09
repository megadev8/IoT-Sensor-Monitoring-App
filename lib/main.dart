import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Monitoring App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String iotHubConnectionString =
      'HostName=monitoringapp1.azure-devices.net;DeviceId=mydevice;SharedAccessKey=vQcBH8Zj2ogdY8oSm2pScGeucptn24YMTAIoTPFo5tg=';

  Future<void> _connectToIoTHub() async {
    final mqttClient =
        MqttServerClient('mydevice', 'monitoringapp1.azure-devices.net');
    mqttClient.logging(on: true);

    final mqttConnection =
        MqttServerClient('mydevice', 'monitoringapp1.azure-devices.net');
    mqttConnection.useWebSocket = false;
    mqttConnection.port = 8883;
    mqttConnection.secure = true;

    await mqttConnection.connect(
        'mydevice', 'vQcBH8Zj2ogdY8oSm2pScGeucptn24YMTAIoTPFo5tg=');
    print('Connected to Azure IoT Hub');

    // Subscribe to desired topics and handle incoming messages
    mqttConnection.subscribe(
        'devices/mydevice/messages/events/temperature', MqttQos.atMostOnce);
    mqttConnection.subscribe(
        'devices/mydevice/messages/events/humidity', MqttQos.atMostOnce);
    mqttConnection.subscribe(
        'devices/mydevice/messages/events/ph', MqttQos.atMostOnce);

    mqttConnection.updates
        ?.listen((List<MqttReceivedMessage<MqttMessage>>? event) {
      final MqttPublishMessage? message =
          event![0].payload as MqttPublishMessage?;
      final String? payload = message?.payload.message.toString();

      print('Received message: $payload');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Monitoring App',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
