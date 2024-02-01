import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/todo_provider.dart';

//Handles deletion of a todo
class BuildDeleteTodoButton extends StatelessWidget {
  const BuildDeleteTodoButton(
      {Key? key, required this.context, required this.id})
      : super(key: key);

  final BuildContext context;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0)), //this right here
                    child: SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Do you want to delete the task?'),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                width: 320.0,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("Delete"),
                                        onPressed: () {
                                          context
                                              .read<TodoListProvider>()
                                              .deleteTodo(id);
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ]))
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
