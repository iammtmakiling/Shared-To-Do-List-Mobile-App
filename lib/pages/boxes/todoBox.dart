import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../models/user.model.dart';
import '../../providers/todo_provider.dart';
import '../buttons/viewtodobutton.dart';

//Container for the Todo
class ToDoBox extends StatelessWidget {
  const ToDoBox({
    Key? key,
    required this.context,
    required this.task,
    required this.status,
    required this.currentUser,
    required this.index,
  }) : super(key: key);

  final BuildContext context;
  final Todo task;
  final String status;
  final Users currentUser;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: task.status,
                checkColor: Colors.white, // color of tick Mark
                activeColor: const Color(0xff967259),
                onChanged: (bool? value) {
                  context
                      .read<TodoListProvider>()
                      .toggleStatus(task.id, value!);
                }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task.taskname,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  task.deadline.toString().substring(0, 11),
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            Text(
              status,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            Align(
                alignment: Alignment.center,
                child: BuildViewButton(
                    context: context,
                    task: task,
                    status: status,
                    currentUser: currentUser,
                    index: index))
          ],
        ));
  }
}
