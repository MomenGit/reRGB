import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import 'api_controller.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final pickerController =
      CircleColorPickerController(initialColor: Colors.white);
  ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return CircleColorPicker(
      //size: const Size(250, 250),
      onChanged: (value) {
        setState(() {
          apiController.currentColor = value;
        });
      },
      controller: pickerController,
    );
  }
}
