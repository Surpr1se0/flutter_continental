import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text(
        'blue Page',
        style: TextStyle(fontSize: 50, color: Colors.white),
      )
    );
  }
}