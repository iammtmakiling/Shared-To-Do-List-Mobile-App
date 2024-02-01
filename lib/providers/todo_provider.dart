// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/firebase_todo_api.dart';
import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  late FirebaseTodoAPI firebaseService;
  late Stream<QuerySnapshot> _todosStream;

  Todo? _selectedTodo;

  TodoListProvider() {
    firebaseService = FirebaseTodoAPI();
    fetchTodos();
  }

  Stream<QuerySnapshot> get todos => _todosStream;
  Todo get selected => _selectedTodo!;

  //Fetch all todos from the firebase
  fetchTodos() {
    _todosStream = firebaseService.getAllTodos();
    notifyListeners();
  }

  //Delete Todo
  void deleteTodo(id) {
    firebaseService.deleteTodo(id);
  }

  //Change Todo Status
  void toggleStatus(String id, bool status) {
    firebaseService.toggleStatus(id, status);
    notifyListeners();
  }

  //Edit Todo Status
  void edittodo(String id, String taskname, String description, String deadline,
      String lastUpdateOn, String lastUpdateBy) {
    firebaseService.edittodo(
        id, taskname, description, deadline, lastUpdateOn, lastUpdateBy);
  }

  //Add Todo Status
  void addtodo(Todo todo) {
    firebaseService.addtodo(todo.toJson(todo));
  }
}
