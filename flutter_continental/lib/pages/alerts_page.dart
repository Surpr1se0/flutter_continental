import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Controllers/HomeController.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import '../Controllers/AvariaClasse.dart';
import '../Controllers/DataModel.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  //const AlertsPage({super.key, Key? key});

  /*Future<DataModel> submitData() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? token = await user?.getIdToken();
    String funcionarioId = user?.displayName ?? '';
    HomeController homeController = Get.find<HomeController>();
    int linhaId = homeController.selectedLine.value;

    var response = await http.post(
      Uri.https('192.168.28.86:7071', 'Alert/SendAlert'),
      headers: <String, String>{
        'Authorization': 'Bearer ${token ?? ''}',
      },
      body: {
  "id": "0",
  "funcionarioId": funcionarioId,
  "linhaId": linhaId,
  "tipo": "Avaria",
  "prioridade": "",
  "estado": "true",
  "criacao": "",
}
    );
    var data = response.body;
    print(data);
    if (response.statusCode == 200) {
      return DataModel.fromJson(jsonDecode(
          data)); // Assuming this is how you create an instance of DataModel from JSON.
    } else {
      throw Exception('Failed to submit data');
    }
  }*/

/*void postAlert() async {
  User? user = FirebaseAuth.instance.currentUser;
  String? token = await user?.getIdToken();
  String funcionarioId = user?.displayName ?? '';
  HomeController homeController = Get.find<HomeController>();
  int linhaId = homeController.selectedLine.value;

  // Create instance of AvariaNotification
    AvariaNotification avariaNotification = AvariaNotification(
    id: 0,
    funcionarioId: funcionarioId,
    linhaId: linhaId,
    tipo: 'Avaria',
    prioridade: '',
    estado: true,
    criacao: '',
  );

  final response = await http.post(
    Uri.https('192.168.28.86:7071', 'Alert/SendAlert'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token ?? ''}',
    },
    // Use toJson() method to convert object to JSON
    body: jsonEncode(avariaNotification.toJson()),
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}*/



void postAlert() async {
  User? user = FirebaseAuth.instance.currentUser;
  String? token = await user?.getIdToken();
  String funcionarioId = user?.displayName ?? '';
  HomeController homeController = Get.find<HomeController>();
  int linhaId = homeController.selectedLine.value;

  final dio = Dio();

  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "Bearer ${token ?? ''}";

  final data = {
    'id': 0,
    'funcionarioId': funcionarioId,
    'linhaId': linhaId,
    'tipo': 'Avaria',
    'prioridade': '',
    'estado': true,
    'criacao': ''
  };

  try {
    Response response = await dio.post('http://192.168.28.86:7071/Alert/SendAlert', data: data);
    print(response);
  } on DioError catch (e) {
    print('Request error: $e');
  }
}



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
                  Icon(
                    Icons.security_update_warning_outlined,
                    size: 40.0,
                    color: Colors.orangeAccent.shade400,
                  ),
                  Container(
                    width: 170,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myColor,
                    ),
                    child: textSection,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          postAlert();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: const Text('Yes'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade600),
                        ),
                        child: const Text('No'),
                      ),
                    ],
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
    style: TextStyle(fontSize: 15, color: Colors.white),
    textAlign: TextAlign.center,
  ),
);
