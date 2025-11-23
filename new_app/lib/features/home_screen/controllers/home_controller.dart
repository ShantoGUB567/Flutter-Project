import 'package:get/get.dart';
import 'package:new_app/data/model/product_model.dart';

class HomeController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts(){
    products.value = [
      Product(id: 1, name: "Phone", description: "Smart Phone Mobile", prices: 50),
      Product(id: 2, name: "Laptop", description: "Asus Gamming Laptop", prices: 90),
      Product(id: 3, name: "Monitor", description: "HP 24 inch monitor", prices: 30),
      Product(id: 4, name: "Mac Mini", description: "Mac Mini M4", prices: 100),
    ];
  }

  void goToProductDetails(Product products){
    Get.toNamed('/product_details', arguments: products);
  }
}