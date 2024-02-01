import 'dart:convert';

//Model for the Todo
//Must contain all the information stated
class Todo {
  String id;
  String taskname;
  String deadline;
  String description;
  bool status;
  String ownerId;
  String ownerName;
  String lastUpdateOn;
  String lastUpdateBy;

  Todo({
    required this.id,
    required this.taskname,
    required this.deadline,
    required this.description,
    required this.status,
    required this.ownerId,
    required this.ownerName,
    required this.lastUpdateOn,
    required this.lastUpdateBy,
  });

  // Factory constructor to instantiate object from json format
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        taskname: json['taskname'],
        description: json['description'],
        deadline: json['deadline'],
        status: json['status'],
        ownerId: json['ownerId'],
        ownerName: json['ownerName'],
        lastUpdateBy: json['lastUpdateBy'],
        lastUpdateOn: json['lastUpdateOn']);
  }

  static List<Todo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Todo>((dynamic d) => Todo.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Todo todo) {
    return {
      'id': todo.id,
      'taskname': todo.taskname,
      'description': todo.description,
      'deadline': todo.deadline,
      'status': todo.status,
      'ownerId': todo.ownerId,
      'ownerName': todo.ownerName,
      'lastUpdateOn': todo.lastUpdateOn,
      'lastUpdateBy': todo.lastUpdateBy
    };
  }
}
