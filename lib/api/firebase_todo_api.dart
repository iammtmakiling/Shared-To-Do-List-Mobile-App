import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  // final db = FakeFirebaseFirestore();
  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      final docRef = await db.collection("todos").add(todo);
      await db.collection("todos").doc(docRef.id).update({'id': docRef.id});

      return "Successfully added todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  //Handles Todo fetching
  Stream<QuerySnapshot> getAllTodos() {
    return db.collection("todos").snapshots();
  }

  //Handles Deletion of Todo
  Future<String> deleteTodo(String? id) async {
    try {
      await db.collection("todos").doc(id).delete();

      return "Successfully deleted todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  //Handles changing of todo status
  toggleStatus(id, value) async {
    try {
      await db.collection("todos").doc(id).update({"status": value}).onError(
          (e, _) => print("Error writing document: $e"));
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  //Handles adding of todo
  Future<String> addtodo(Map<String, dynamic> todo) async {
    try {
      final docRef = await db.collection("todos").add(todo);
      await db.collection("todos").doc(docRef.id).update({'id': docRef.id});

      return "Successfully added todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  //Handles Editing of Todo
  void edittodo(String id, String taskname, String description, String deadline,
      String lastUpdateOn, String lastUpdateBy) async {
    try {
      await db.collection("todos").doc(id).update({
        "taskname": taskname,
        "description": description,
        "deadline": deadline,
        "lastUpdateOn": lastUpdateOn,
        "lastUpdateBy": lastUpdateBy,
      }).onError((e, _) => print("Error writing document: $e"));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
