import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:re_rgb/api.dart';

class DefaultModePage extends StatefulWidget {
  const DefaultModePage({super.key});

  @override
  State<DefaultModePage> createState() => _DefaultModePageState();
}

class _DefaultModePageState extends State<DefaultModePage> {
  Color currentColor = Colors.white;
  var pickerController =
      CircleColorPickerController(initialColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleColorPicker(
          //size: const Size(250, 250),
          onChanged: (value) {
            setState(() {
              currentColor = value;
              Api.sendColor(value);
            });
          },
          controller: pickerController,
        ),
      ],
    );
  }
}
