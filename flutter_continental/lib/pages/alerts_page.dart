import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10,
                    ),
                    child: textSection,
                    ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Press me'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget textSection = const Padding(
  padding: EdgeInsets.all(3),
  child: Text(
    'Are you sure you wish to send an alert?',
    softWrap: true,
    style: TextStyle(
      fontSize: 15,
      color: Colors.white
      ),
  ),
);
