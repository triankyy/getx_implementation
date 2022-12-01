import 'package:dio/dio.dart';
import 'package:project_template/app/data/providers/api.provider.dart';
import '../models/todo.model.dart';

class TodoService {
  HttpClient httpClient = HttpClient();

  Future<List<TodoModel>> getAll() async {
    try {
      Response response = await httpClient.get("/todos");
      List jsonResponse = response.data;
      return jsonResponse.map<TodoModel>((map) => TodoModel.fromJson(map)).toList();
    } on DioError catch(_) {
      throw Exception(_.message);
    }
  }

  Future<TodoModel> getId(num id) async {
    try {
      Response response = await httpClient.get("/todos/$id");
      return TodoModel.fromJson(response.data);
    } on DioError catch(_) {
      throw Exception(_.message);
    }
  }

}