import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../models/user.model.dart';
import '../buttons/viewfriendtodobutton.dart';

//Container for the friends todo
class FriendToDoBox extends StatelessWidget {
  const FriendToDoBox({
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
    if (task.status == true) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              const CircleAvatar(
                backgroundColor: Color(0xff567451),
                maxRadius: 15,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    task.taskname,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    task.deadline.toString().substring(0, 11),
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          status,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(width: 20),
                        BuildViewFriendTodoButton(
                            context: context,
                            task: task,
                            status: status,
                            currentUser: currentUser,
                            index: index)
                      ])),
            ]),
      );
    } else {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              const CircleAvatar(
                backgroundColor: Color(0xff943337),
                maxRadius: 15,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    task.taskname,
                    // textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    task.deadline.toString().substring(0, 11),
                    // textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          status,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(width: 20),
                        BuildViewFriendTodoButton(
                            context: context,
                            task: task,
                            status: status,
                            currentUser: currentUser,
                            index: index)
                      ])),
            ]),
      );
    }
  }
}
