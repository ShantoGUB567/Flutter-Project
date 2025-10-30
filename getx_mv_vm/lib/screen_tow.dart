import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mv_vm/screen_one.dart';

class ScreenTow extends StatefulWidget {
  const ScreenTow({super.key});

  @override
  State<ScreenTow> createState() => _ScreenTowState();
}

class _ScreenTowState extends State<ScreenTow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen-2"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            //using get
            Get.to(() => ScreenOne());
          }, child: Text("Go Back page-1")),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: () {
            //using get
            Get.back();
          }, child: Text("Go Back")),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: () {
            //using get
            Get.back();
            Get.back();
          }, child: Text("Go Back Home")),


        ],
      ),
    );
  }
}
