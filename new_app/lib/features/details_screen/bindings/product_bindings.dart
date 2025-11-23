import 'package:get/get.dart';
import 'package:new_app/features/details_screen/controllers/details_controllers.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}