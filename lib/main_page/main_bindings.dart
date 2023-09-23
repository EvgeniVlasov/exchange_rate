import 'package:exchange_rates/main_page/main_controller.dart';
import 'package:exchange_rates/servises/main_service.dart';
import 'package:get/get.dart';

final class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(
        MainController(mainService: Get.find<MainService>()));
  }
}
