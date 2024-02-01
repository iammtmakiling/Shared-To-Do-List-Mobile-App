import 'package:exercise6/models/todo_model.dart';
import 'package:exercise6/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.model.dart';
import '../textformfield/textfield.dart';

//Handles creating a todo
class BuildAddToDoButton extends StatelessWidget {
  const BuildAddToDoButton({
    Key? key,
    required this.context,
    required this.currentUser,
  }) : super(key: key);

  final BuildContext context;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final firstDate = DateTime.now();
    final lastDate = DateTime(DateTime.now().year + 120);
    String todayDate =
        DateTime(firstDate.year, firstDate.month, firstDate.day).toString();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String selectedDate = "";

    return Container(
        height: 50,
        width: 150,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          child: const Text('Add To Do'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: Form(
                        key: formKey,
                        child: SizedBox(
                          height: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Adding To Do",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 10),
                                BuildTextFormField(
                                    label: "Title",
                                    controller: titleController,
                                    obscure: false),
                                const SizedBox(height: 10),
                                BuildTextFormField(
                                    label: "Description",
                                    controller: descriptionController,
                                    obscure: false),
                                const SizedBox(height: 10),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: InputDatePickerFormField(
                                    firstDate: firstDate,
                                    lastDate: lastDate,
                                    fieldLabelText: 'Deadline',
                                    errorFormatText:
                                        'Invalid Format / Field can\'t be empty',
                                    onDateSaved: (date) {
                                      selectedDate = date.toString();
                                      print(selectedDate);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                    width: 300.0,
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
                                                titleController.clear();
                                                descriptionController.clear();
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
                                                  Todo todo = Todo(
                                                    id: "",
                                                    taskname:
                                                        titleController.text,
                                                    description:
                                                        descriptionController
                                                            .text,
                                                    deadline: selectedDate,
                                                    status: false,
                                                    ownerId: currentUser.userId,
                                                    ownerName: currentUser.name,
                                                    lastUpdateOn: todayDate,
                                                    lastUpdateBy:
                                                        currentUser.name,
                                                  );
                                                  context
                                                      .read<TodoListProvider>()
                                                      .addtodo(todo);
                                                  titleController.clear();
                                                  descriptionController.clear();
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
