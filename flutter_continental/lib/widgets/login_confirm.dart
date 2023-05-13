import 'package:flutter/material.dart';
import 'package:flutter_continental/pages/welcome_page.dart';

import 'package:http/http.dart' as http;

class LoginConfirm extends StatefulWidget {
  bool? isResponsive;
  double? size;
  Object? heroTag;

  LoginConfirm({Key? key, this.size, this.isResponsive = false, this.heroTag})
      : super(key: key);


  @override
  State<LoginConfirm> createState() => _LoginConfirmState();
}

class _LoginConfirmState extends State<LoginConfirm> {
  bool _pressed = false;

  void _onPressed() async{
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const WelcomePage())
    // );

    var url = Uri.http("my-json-server.typicode.com", "/typicode/demo/posts");
    var response = await http.get(url);
    print("Response body ${response.body}");
    
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 40,
      child: FittedBox(
        child: FloatingActionButton.extended(
          heroTag: widget.heroTag,
          backgroundColor: _pressed
              ? Colors.orangeAccent
              : Colors.white60, 
          onPressed: () {
            setState(() {
              _pressed = !_pressed;
            });
            _onPressed();
          },
          icon: const Icon(
            Icons.login,
            size: 24.0,
          ),
          label: const Text('Login'),
        ),
      ),
    );
  }
}
