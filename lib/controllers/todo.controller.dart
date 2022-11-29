import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:getx_implementation/models/todo.model.dart';

class TodoController extends GetxController {
  RxList todoList = <Todos>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    Dio dio = Dio();
   try {
      Response response = await dio.get("https://jsonplaceholder.typicode.com/todos");
      if (response.statusCode == 200) {
        List data = response.data;
        todoList.value = data.map((e) => Todos.fromJson(e)).toList();
      } else {
        throw "error";
      }
    } catch (e) {
      Get.snackbar("title", "message");
      throw Exception(e);
    }
  }
}