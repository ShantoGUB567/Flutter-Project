import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/features/details_screen/controllers/details_controllers.dart';
import 'package:new_app/features/obx/view/obx_screen.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                controller.product.name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                controller.product.description,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                controller.product.prices.toString(),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: controller.goBack, child: Text("Go Back")),
              
              SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => ObxScreen());
                  }, 
                  child: Text("Use of Obx")
              ),

            ],
          ),
        ),
      ),
    );
  }
}
