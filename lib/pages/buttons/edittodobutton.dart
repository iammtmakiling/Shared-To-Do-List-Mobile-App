import 'package:exercise6/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../models/user.model.dart';
import '../textformfield/texteditfield.dart';

//Handles editing of the todo
class BuildEditTodoButton extends StatefulWidget {
  const BuildEditTodoButton(
      {Key? key,
      required this.context,
      required this.titleController,
      required this.descriptionController,
      required this.currentUser,
      required this.task,
      required this.index})
      : super(key: key);

  final BuildContext context;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Users currentUser;
  final Todo task;
  final int index;

  @override
  State<BuildEditTodoButton> createState() => _BuildEditTodoButton();
}

class _BuildEditTodoButton extends State<BuildEditTodoButton> {
  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime.now();
    final lastDate = DateTime(DateTime.now().year + 120);
    String todayDate =
        DateTime(firstDate.year, firstDate.month, firstDate.day).toString();

    String selectedDate = "";
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          child: const Text('Edit'),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Form(
                        key: formKey,
                        //this right here
                        child: SizedBox(
                          height: 450,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Editing To Do",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 10),
                                BuildEditTextFormField(
                                    controller: widget.titleController,
                                    hint: widget.task.taskname,
                                    obscure: false),
                                const SizedBox(height: 10),
                                BuildEditTextFormField(
                                    hint: widget.task.description,
                                    controller: widget.descriptionController,
                                    obscure: false),
                                const SizedBox(height: 10),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: InputDatePickerFormField(
                                    firstDate: firstDate,
                                    lastDate: lastDate,
                                    fieldLabelText: "New Deadline",
                                    errorFormatText:
                                        'Invalid Format / Field can\'t be empty',
                                    onDateSaved: (date) {
                                      selectedDate = date.toString();
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                    width: 320.0,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                              child: const Text("Cancel"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                              child: const Text("Save"),
                                              onPressed: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  formKey.currentState!.save();
                                                  context
                                                      .read<TodoListProvider>()
                                                      .edittodo(
                                                          widget.task.id,
                                                          widget.titleController
                                                              .text,
                                                          widget
                                                              .descriptionController
                                                              .text,
                                                          selectedDate,
                                                          todayDate,
                                                          widget.currentUser
                                                              .name);
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                            ),
                                          ),
                                        ]))
                              ],
                            ),
                          ),
                        ),
                      ));
                });
          },
        ));
  }
}
