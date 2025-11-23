import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/data/model/product_model.dart';
import 'package:new_app/features/home_screen/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.teal,
      ),

      body: SafeArea(
        child: Obx(() => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index){
            final product = controller.products[index];
            return Card(
              margin: EdgeInsets.all(20),
              child: ListTile(
                title: Text(product.name),
                subtitle: Text("USD ${product.prices}"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => controller.goToProductDetails(product),
              ),
            );
          },
        ),
        ),

      ),
    );
  }

}

