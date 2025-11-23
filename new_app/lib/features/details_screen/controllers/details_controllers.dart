import 'package:get/get.dart';
import 'package:new_app/data/model/product_model.dart';

class ProductDetailsController extends GetxController {
  late Product product;

  @override
  void onInit (){
    super.onInit();
    product = Get.arguments as Product;
  }

  void goBack(){
    Get.back();
  }
}