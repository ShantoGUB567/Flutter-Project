import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mv_vm/screen_tow.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen-1"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            //Flutter Process
            // Navigator.pop(context);

            //using get
            Get.back();
          }, child: Text("Go Back")),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: () {
            //using get
            Get.to( () => ScreenTow());
          }, child: Text("Go to Page=2")),


        ],
      ),
    );
  }
}
