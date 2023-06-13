import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_continental/pages/page_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_continental/pages/login_page.dart';
import 'package:dart_amqp/dart_amqp.dart';
import 'Controllers/HomeController.dart';
import 'package:get/get.dart';
import 'dart:convert';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    _setupRabbitMQ();

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return const PageViewWidget();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

  void _setupRabbitMQ() async {
    ConnectionSettings settings = ConnectionSettings(
      host: "192.168.28.86",
    );

      Client client = Client(settings: settings);
      client.channel().then((Channel channel) async {
      Queue queue = await channel.queue("notification");
      Exchange exchange = await channel.exchange("alertas", ExchangeType.TOPIC);
      Consumer consumer = await exchange.bindQueueConsumer("notification", ["alerts.maintenance.new"]);

      consumer.listen((AmqpMessage message) {
        print(" [x] Received alert: ${message.payloadAsJson}");

        var payload = jsonDecode(message.payloadAsString);


        //String linhaId = payload["linhaId"];


        // Now, you can show the AlertDialog with the data received.
        navigatorKey.currentState!.push(MaterialPageRoute<void>(
          builder: (BuildContext context) => AlertDialog(
            title: const Text("New alert"),
            content: Text("Alert received: ${message.payloadAsJson}"),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ));
      });
    });
  }
}



Future<String?> getUserRole(User user) async {
  final IdTokenResult tokenResult = await user.getIdTokenResult();
  final claims = tokenResult.claims;

  if (claims != null) {
    if (claims.containsKey('role')) {
      return claims['role'] as String?;
    }
  }

  return null;
}

