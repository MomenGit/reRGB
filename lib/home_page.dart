import 'package:flutter/material.dart';
import 'package:re_rgb/api.dart';
import 'package:re_rgb/default_mode_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.control_camera_rounded),
        title: Text(
          "My ESP RGB LED Controller",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultModePage(),
            ModeSelector(),
          ],
        ),
      ),
    );
  }
}

class ModeSelector extends StatefulWidget {
  const ModeSelector({super.key});

  @override
  State<ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<ModeSelector> {
  static const List<String> _modes = [
    "Default Mode",
    "Rainbow Mode",
    "Brightness Cycle",
    "Bounce Mode"
  ];
  String _selectedMode = _modes[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 3,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedMode,
          items: _modes
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Center(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedMode = value!;
              Api.sendMode(_modes.indexOf(value));
            });
          },
        ),
      ),
    );
  }
}
