import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller_bindings.dart';
import 'package:getx_implementation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Implementation',
      initialBinding: ControllerBindings(),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:  Home(),
    );
  }
}