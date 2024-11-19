import 'package:get/get.dart';
import 'package:pas1_11pplg1_14/controllers/Dashboard_controller.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
