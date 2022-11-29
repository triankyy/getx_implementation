import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controllers/todo.controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(
          children: todoController.todoList.map((e) {
            return ListTile(
              title: Text(e.title),
              leading: Text(e.completed.toString()),
            );
          }).toList()
        )),
      ),
    );
  }
}
