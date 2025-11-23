import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/app_page.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx Demo",
      initialRoute: '/home',
      getPages: AppPage.route,
    );
  }
}
