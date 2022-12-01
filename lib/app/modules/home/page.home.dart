import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/app/modules/home/controller.home.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        leading: controller.isSearch.isFalse
          ? null
          : IconButton(
            onPressed: () {
              controller.isSearch.value = false;
              controller.getAllTodo();
            }, 
            icon: const Icon(CupertinoIcons.back)
          ),
        actions: controller.isSearch.isTrue ? [] : [
          IconButton(
            onPressed: () {
              controller.isSearch.value = true;
            }, 
            icon: const Icon(Icons.search)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: controller.isSearch.isFalse 
          ? (controller.isLoading.isTrue 
              ? const LinearProgressIndicator()
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: controller.todoList.map<Widget>((e) {
                    return ListTile(
                      title: Text(e.title),
                      trailing: Checkbox(
                        value: e.completed, 
                        onChanged: (bool? val) {
                          // controller.todoList.;
                          controller.todoList.value[controller.todoList.indexOf(e)].completed = val;
                          print(controller.todoList[controller.todoList.indexOf(e)].completed);
                        }
                      ),
                    );
                  }).toList()
                ),
              )
            )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Stack(
                  children: [
                    controller.isLoading.isFalse ? Container() : const Positioned(
                      bottom: 12,
                      right: 15,
                      child: CircularProgressIndicator()
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Search Todo",
                      ),
                      controller: controller.searchController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                        print(value);
                          controller.searchTodo();
                        }
                      },
                    ),
                  ],
                ),
                controller.todo.value == null
                  ? Container()
                  : ListTile(
                    title: Text(controller.todo.value!.title),
                    trailing: Checkbox(value: controller.todo.value!.completed, onChanged: (bool? value) {}),
                  )
              ],
            ),
          )
      ),
    ));
  }
}