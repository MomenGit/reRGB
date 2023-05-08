import 'package:flutter/material.dart';
import 'package:re_rgb/api_controller.dart';

class ModeSelector extends StatefulWidget {
  const ModeSelector({super.key});

  @override
  State<ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<ModeSelector> {
  ApiController apiController = ApiController();
  String? selectedMode;
  @override
  Widget build(BuildContext context) {
    selectedMode = apiController.modes[apiController.currentMode];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 3,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconEnabledColor: Colors.black,
          value: selectedMode,
          items: apiController.modes
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              apiController.currentMode = apiController.modes.indexOf(value!);
              //Api.sendMode(_modes.indexOf(value));
            });
          },
        ),
      ),
    );
  }
}
