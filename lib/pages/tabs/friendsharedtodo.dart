import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';
import '../boxes/friendtodobox.dart';
import '../../models/user.model.dart';

class FriendToDoTab extends StatelessWidget {
  const FriendToDoTab({
    Key? key,
    required this.context,
    required this.currentUser,
    required this.friend,
  }) : super(key: key);

  final Users currentUser;
  final BuildContext context;
  final Users friend;

  //Handles the sharedtodo tab of the friend
  @override
  Widget build(BuildContext context) {
    String currentStatus = "";
    int todoCounter = 0;
    Stream<QuerySnapshot> todoStream = context.watch<TodoListProvider>().todos;
    final todos = todoStream;
    return Scaffold(
        body: Column(
      children: [
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
                    if (currentUser.friends.contains(friend.userId)) {
                      return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: ((context, index) {
                          Todo todo = Todo.fromJson(snapshot.data?.docs[index]
                              .data() as Map<String, dynamic>);

                          //Check status, and change it to string
                          if (todo.status == false) {
                            currentStatus = "In Progress";
                          } else {
                            currentStatus = "Accomplished";
                          }

                          if (todo.ownerId == friend.userId) {
                            todoCounter++;
                            return FriendToDoBox(
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
                                    child: const Center(
                                      child: Text("User has no shared todo!"),
                                    ));
                              }
                            }
                            return Container();
                          }
                        }),
                      );
                    } else {
                      return const Center(
                        child: Text("Must be friends to see shared todo"),
                      );
                    }
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
