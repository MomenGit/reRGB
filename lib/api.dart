import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String deviceIP =
      "192.168.1.4"; // Replace with your ESP8266 IP address
// Define helper functions
  static void sendColor(Color color) async {
    // Send the color values to the ESP8266
    var r = color.red;
    var g = color.green;
    var b = color.blue;
    var data = '{"r":$r,"g":$g,"b":$b}';
    var url = Uri.http(deviceIP, '/');
    try {
      var response = await http.post(url, body: data);
      print('Sent color data: $data');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Cannot send color data, exception occurred: $e');
    }
  }

  /*static void sendBrightness(int brightness) async {
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
  }*/

  static void sendMode(int mode) async {
    // Send the mode value to the ESP8266
    var data = '{"mode":$mode}';
    var url = Uri.http(deviceIP, '/');
    try {
      var response = await http.post(url, body: data);
      print('Sent mode data: $data');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Cannot send mode data, exception occurred: $e');
    }
  }
}
