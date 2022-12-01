import 'package:get/get.dart';
import 'package:project_template/app/modules/home/controller.home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}