import 'package:exchange_rates/main_page/main_bindings.dart';
import 'package:exchange_rates/main_page/main_screen.dart';
import 'package:exchange_rates/rouiting/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static const main = Routes.mainPage;

  static final pages = [
    GetPage(
      name: Routes.mainPage,
      page: () => const MainScreen(),
      binding: MainBindings(),
    ),
  ];
}
