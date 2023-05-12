import 'package:flutter/material.dart';
import 'package:flutter_continental/widgets/app_large_text.dart';
import 'package:flutter_continental/widgets/login_confirm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(64, 64, 64, 0.4);
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
                  AppLargeText(
                    text: 'Login',
                    size: 25,
                    color: Colors.orangeAccent.shade400,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 40,
                    width: 190,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 190,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),LoginConfirm()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
