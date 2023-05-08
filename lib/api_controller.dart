import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiController {
  ApiController._internal();
  static final ApiController _instance = ApiController._internal();
  factory ApiController() => _instance;

  final String deviceIP = "192.168.1.4"; // Replace with your ESP8266 IP address
  final List<String> modes = [
    "Default Mode",
    "Rainbow Mode",
    "Brightness Cycle",
    "Bounce Mode"
  ];
  int currentMode = 0;
  Color currentColor = Colors.white;
  // Define helper functions
  void send() async {
    // Send the color values to the ESP8266
    final data =
        '$currentMode+${currentColor.red}+${currentColor.green}+${currentColor.blue}';
    final url = Uri.http(deviceIP, '/$data');
    print(data);
    try {
      final response = await http.post(url, body: data);
    } catch (e) {}
  }

  /*void sendColor(Color color) async {
    // Send the color values to the ESP8266
    final data = '${color.red}+${color.green}+${color.blue}';
    final url = Uri.http(deviceIP, '/$data');

    try {
      final response = await http.post(url, body: data);
    } catch (e) {}
  }

  void sendBrightness(int brightness) async {
    // Send the brightness value to the ESP8266
    var data = '{"brightness":$brightness}';
    var url = Uri.http(deviceIP, '/');
    try {
      var response = await http.post(url, body: data);
      print('Sent brightness data: $data');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Cannot send brightness data, exception occurred: $e');
    }
  }

  void sendMode(int mode) async {
    // Send the mode value to the ESP8266
    var data = '$mode';
    var url = Uri.http(deviceIP, '/$mode');

    try {
      var response = await http.post(url, body: data);
    } catch (e) {}
  }*/
}
