import 'package:get/get.dart';
import 'package:getx_implementation/controllers/todo.controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TodoController>(TodoController());
  }

}