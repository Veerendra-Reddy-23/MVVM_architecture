import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/to_do_model.dart';

class TodoViewModel extends ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(String title, String description) {
    final newTodo = TodoModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodo(String id, String title, String description) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].title = title;
      _todos[index].description = description;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}