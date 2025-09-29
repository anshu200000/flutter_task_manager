import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  // Fetch tasks from API
  Future<void> fetchTasks() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _tasks = data.take(10).map((e) => Task.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception("Failed to load tasks");
    }
  }

  // Add task locally + API
  Future<void> addTask(String title) async {
    final newTask = Task(id: _tasks.length + 1, title: title, completed: false);
    _tasks.add(newTask);
    notifyListeners();

    await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(newTask.toJson()),
    );
  }

  // Delete task locally + API
  Future<void> deleteTask(int id) async {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();

    await http.delete(Uri.parse("$apiUrl/$id"));
  }
}
