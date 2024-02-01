import 'package:exercise6/pages/buttons/edittodobutton.dart';
import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../models/user.model.dart';

//Handles the presentation of the friends todo list
//Changes color of the todo depending on the status
//Green if accomplished
//Red if not
class BuildViewFriendTodoButton extends StatelessWidget {
  const BuildViewFriendTodoButton(
      {Key? key,
      required this.context,
      required this.task,
      required this.status,
      required this.currentUser,
      required this.index})
      : super(key: key);

  final BuildContext context;
  final Todo task;
  final String status;
  final Users currentUser;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    if (task.status != true) {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextButton(
            child: const Text('View'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: SizedBox(
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                task.taskname,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                status,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                task.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Last Update on: ${task.lastUpdateOn.substring(0, 11)}",
                                            textAlign: TextAlign.left,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            "Last Update by: ${task.lastUpdateBy}",
                                            textAlign: TextAlign.left,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ])),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  width: 320.0,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                          width: 100,
                                          child: BuildEditTodoButton(
                                              context: context,
                                              titleController: titleController,
                                              descriptionController:
                                                  descriptionController,
                                              currentUser: currentUser,
                                              task: task,
                                              index: index))))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ));
    } else {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextButton(
            child: const Text('View'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: SizedBox(
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                task.taskname,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                              Text(
                                status,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                task.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Last Update on: ${task.lastUpdateOn.substring(0, 11)}",
                                            textAlign: TextAlign.left,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            "Last Update by: ${task.lastUpdateBy}",
                                            textAlign: TextAlign.left,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ));
    }
  }
}
