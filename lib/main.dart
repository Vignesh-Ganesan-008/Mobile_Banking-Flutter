import 'package:Mobile_Banking/Dummy_DB.dart';
import 'package:Mobile_Banking/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    readCounter();
    return MaterialApp(
      title: 'Vicky Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
