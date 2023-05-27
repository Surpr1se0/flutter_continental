import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginConfirm extends StatefulWidget {
  bool? isResponsive;
  double? size;
  Object? heroTag;
  final TextEditingController emailController;
  final TextEditingController passwordController;


  LoginConfirm({Key? key, this.size, this.isResponsive = false, this.heroTag, required this.emailController, required this.passwordController})
      : super(key: key);


  @override
  State<LoginConfirm> createState() => _LoginConfirmState();
}

class _LoginConfirmState extends State<LoginConfirm> {
  bool _pressed = false;



  Future _onPressed() async{
    String email = widget.emailController.text.trim();
    String password = widget.passwordController.text.trim();
   
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
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
