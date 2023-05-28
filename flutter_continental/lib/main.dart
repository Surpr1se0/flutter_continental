import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_continental/pages/page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_continental/pages/login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? user = snapshot.data;
              // Verificar se o usuário não é nulo
              if (user != null) {
                // Obtém o email e o token
                String email = user.email ?? 'Nenhum email fornecido';
                user.getIdToken().then((String token) {
                  print('Email: $email, Token: $token');
                  // Use o email e o token conforme necessário
                });
              }
              return const PageViewWidget();
            } else {
              return LoginPage();
            }
          },
        ));
  }
}
