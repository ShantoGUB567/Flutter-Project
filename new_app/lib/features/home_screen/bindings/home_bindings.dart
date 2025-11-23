import 'package:get/get.dart';
import 'package:new_app/features/home_screen/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}