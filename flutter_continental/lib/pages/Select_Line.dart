import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:get/get.dart';
import '../Controllers/HomeController.dart';

class NumberSelectorPage extends StatefulWidget {
  @override
  _NumberSelectorPageState createState() => _NumberSelectorPageState();
}

class _NumberSelectorPageState extends State<NumberSelectorPage> {
  final PageController _controller = PageController();
  int selectedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Linha:',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: Center(
                child: GetX<HomeController>(
                  builder: (controller) {
                    return NumberPicker(
                      value: controller.selectedLine.value,
                      minValue: 1,
                      maxValue: 50,
                      onChanged: (value) {
                        controller.selectedLine.value = value;
                      },
                      textStyle: TextStyle(
                          color: Colors.white70), // default text style
                      selectedTextStyle: TextStyle(
                          color: Colors
                              .orangeAccent.shade400), // selected number style
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}