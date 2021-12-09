import 'package:flutter/material.dart';
import 'package:entrega_final/pages/home.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: "Empleados",
      routes: {"/": (_) => HomePage()},
    );
  }
}
