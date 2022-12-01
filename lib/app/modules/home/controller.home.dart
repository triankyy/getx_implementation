import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:project_template/app/data/models/todo.model.dart';
import 'package:project_template/app/data/services/todo.service.dart';

class HomeController extends GetxController {
  final TodoService todoService = TodoService();

  RxList todoList = <TodoModel>[].obs;
  Rxn<TodoModel> todo = Rxn<TodoModel>();
  RxBool isLoading = false.obs;
  RxBool isSearch = false.obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  Future<void> getAllTodo() async => todoList.value = await todoService.getAll();

  Future<void> searchTodo() async => todo.value = await todoService.getId(searchController.text);
}