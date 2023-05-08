import 'package:flutter/material.dart';
import 'package:re_rgb/api_controller.dart';
import 'package:re_rgb/color_picker.dart';
import 'package:re_rgb/modes_dropdown_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = ApiController();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.control_camera_rounded),
        title: Text(
          "My ESP RGB LED Strip Controller",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 450,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.circular(8)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorPicker(),
                  ModeSelector(),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                apiController.send();
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(100, 8.0, 100, 8),
                child: Text(
                  'Set',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
