import 'package:get/get.dart';
import 'package:simple_calculator/state_management/controllers/home.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
