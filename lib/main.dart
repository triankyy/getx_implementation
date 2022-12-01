import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_template/core/theme/colors.dart';
import 'package:project_template/routes/pages.dart';

void main() {
  loadingInstance();
  runApp(const MyApp());
}

void loadingInstance() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.wanderingCubes
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColor.tGreen
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColor.tGreen
    ..textColor = AppColor.tGreen
    ..maskColor = Colors.green.withOpacity(0.5)
    ..userInteractions = true
    ..boxShadow = [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(1, 4),
      )
    ]
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Implementation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      getPages: routes,
      builder: EasyLoading.init(),
    );
  }
}