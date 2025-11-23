import 'package:get/get.dart';
import 'package:new_app/features/details_screen/bindings/product_bindings.dart';
import 'package:new_app/features/details_screen/views/details_view.dart';
import 'package:new_app/features/home_screen/bindings/home_bindings.dart';
import 'package:new_app/features/home_screen/views/home_view.dart';

class AppPage {
  static final route = [
    GetPage(name: '/home', page: () => HomeView(), binding: HomeBindings()),
    GetPage(name: '/product_details', page: () => ProductDetailsView(), binding: ProductBindings()),
  ];
}