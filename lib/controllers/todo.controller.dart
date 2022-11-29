import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:getx_implementation/models/todo.model.dart';
// import 'package:getx_implementation/services/todo.service.dart';

class TodoController extends GetxController {
  RxList todoList = <Todos>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    Dio dio = Dio();
    print("jalan");
   try {
      Response response = await dio.get("https://jsonplaceholder.typicode.com/todos");
      if (response.statusCode == 200) {
        List data = response.data;
        todoList.value = data.map((e) => Todos.fromJson(e)).toList();
      } else {
        throw "error";
      }
    } catch (e) {
      print(e);
      throw Get.snackbar("title", "message");
      // throw getx.Get.snackbar("Error", "Terjadi kesalahan");
    }
  }
}