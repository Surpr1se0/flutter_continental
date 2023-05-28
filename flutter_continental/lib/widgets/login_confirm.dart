import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginConfirm extends StatefulWidget {
  bool? isResponsive;
  double? size;
  Object? heroTag;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginConfirm(
      {Key? key,
      this.size,
      this.isResponsive = false,
      this.heroTag,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginConfirm> createState() => _LoginConfirmState();
}

class _LoginConfirmState extends State<LoginConfirm> {
  bool _pressed = false;

  Future _onPressed() async {
    String email = widget.emailController.text.trim();
    String password = widget.passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Verifica se userCredential.user não é nulo antes de chamar getIdToken
      if (userCredential.user != null) {
        String token = await userCredential.user!.getIdToken();
        print(token); // imprime o token no console
      } else {
        // Trata o caso em que userCredential.user é nulo
        print('Erro: userCredential.user é nulo');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Nenhum usuário encontrado para esse e-mail.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha errada fornecida para esse usuário.';
      } else {
        errorMessage = e.message ?? 'Um erro desconhecido ocorreu.';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 40,
      child: FittedBox(
        child: FloatingActionButton.extended(
          heroTag: widget.heroTag,
          backgroundColor: _pressed ? Colors.orangeAccent : Colors.white60,
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
