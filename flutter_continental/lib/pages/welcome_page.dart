import 'package:flutter/material.dart';
import 'package:flutter_continental/widgets/app_large_text.dart';
import 'package:flutter_continental/widgets/app_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

import '../widgets/alert_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM y').format(now);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DigitalClock(
                        hourMinuteDigitTextStyle: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                        showSecondsDigit: false,
                        colon: const Text(
                          ':',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AppText(
                          text: formattedDate,
                          size: 7,
                          color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/continental.png'),
                        fit: BoxFit.scaleDown,
                        alignment: Alignment(0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  AlertButton(),
                  AppLargeText(text: 'Welcome', size: 17),
                  AppText(
                    text: 'José Almeida',
                    size: 12,
                    color: Colors.orangeAccent.shade400,
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
