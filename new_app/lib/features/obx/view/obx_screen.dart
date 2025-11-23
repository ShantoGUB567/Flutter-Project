import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/features/obx/controller/obx_controller.dart';

class ObxScreen extends StatefulWidget {
  ObxScreen({super.key});



  @override
  State<ObxScreen> createState() => _ObxScreenState();
}

class _ObxScreenState extends State<ObxScreen> {

  final ObxController num = Get.put(ObxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Obx Counter"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Obx(() {
              return Text('Count: ${num.count.value}', style: const TextStyle(fontSize: 30));
            }
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: num.decrement,
                icon: Icon(Icons.exposure_minus_1, color: Colors.red, size: 40,),
              ),
              SizedBox(width: 30,),
              IconButton(
                onPressed: num.increment,
                icon: Icon(Icons.exposure_plus_1, color: Colors.green, size: 40,),
              ),


            ],
          ),
        ],
      ),),
    );
  }
}
