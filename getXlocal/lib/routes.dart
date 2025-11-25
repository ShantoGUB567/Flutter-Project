import 'package:get/get.dart';
import 'package:getx_local/views/login_screen.dart';

class Routes {
  static const String login = '/login';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginScreen()),
  ];
}