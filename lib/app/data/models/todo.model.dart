// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

List<TodoModel> todosFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todosToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    TodoModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    int userId;
    int id;
    String title;
    bool completed;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
