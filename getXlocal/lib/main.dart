import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_local/routes.dart';
import 'package:getx_local/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //title: 'API Integration',
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.login,
      getPages: AppPages.pages,
      home: LoginScreen(),
    );
  }
}
