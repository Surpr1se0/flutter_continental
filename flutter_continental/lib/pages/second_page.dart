import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const Text(
        'Green Page',
        style: TextStyle(fontSize: 50, color: Colors.white),
      )
    );
  }
}