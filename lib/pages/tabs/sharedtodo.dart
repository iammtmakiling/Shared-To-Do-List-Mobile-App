import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';
import '../boxes/todoBox.dart';
import '../../models/user.model.dart';
import '../buttons/addtodobutton.dart';

//Handles the sharedtodo of the currentUser
class ToDoTab extends StatelessWidget {
  const ToDoTab({
    Key? key,
    required this.context,
    required this.currentUser,
  }) : super(key: key);

  final Users currentUser;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    String currentStatus = "";
    Stream<QuerySnapshot> todoStream = context.watch<TodoListProvider>().todos;
    final todos = todoStream;
    int todoCounter = 0;
    return Scaffold(
        body: Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child:
                BuildAddToDoButton(context: context, currentUser: currentUser)),
        Expanded(
            child: StreamBuilder(
                stream: todos,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error encountered! ${snapshot.error}"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: ((context, index) {
                        Todo todo = Todo.fromJson(snapshot.data?.docs[index]
                            .data() as Map<String, dynamic>);

                        //Convert status to string
                        if (todo.status == false) {
                          currentStatus = "In Progress";
                        } else {
                          currentStatus = "Accomplished";
                        }

                        if (todo.ownerId == currentUser.userId) {
                          todoCounter++;
                          return ToDoBox(
                              context: context,
                              task: todo,
                              status: currentStatus,
                              currentUser: currentUser,
                              index: index);
                        } else {
                          //Check if there are any todolist to present
                          if (index == (snapshot.data?.docs.length)! - 1) {
                            if (todoCounter == 0) {
                              return Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "No Shared Todo!",
                                      )));
                            }
                          }
                          return Container();
                        }
                      }),
                    );
                  } else {
                    return const Center(
                      child: Text("No task found"),
                    );
                  }
                }))
      ],
    ));
  }
}
