import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' ;
import 'package:http/http.dart' as http;

class LoginControllers extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Future<void> loginAPI() async {
// https://fakeapi.platzi.com/en/rest/auth-jwt/#login
    try{
      final response = await http.post(Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text
          }
      );

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);

      if (response.statusCode == 200){
        Get.snackbar("Login Successfull", data["Congratulations"]);
      }else{
        Get.snackbar("Login Failed", data["error"]);
      }
    }catch(e){
      Get.snackbar("Exception", e.toString());
    }
  }

}