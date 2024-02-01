import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../textformfield/textfield.dart';

//Handles editting of the currentUsers Bio
class BuildEditBioButton extends StatelessWidget {
  const BuildEditBioButton({Key? key, required this.context, required this.id})
      : super(key: key);

  final BuildContext context;
  final String id;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController bioController = TextEditingController();

    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ElevatedButton(
            child: const Text('Edit Bio'),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Form(
                            key: formKey,
                            child: SizedBox(
                                height: 300,
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Editing User Bio",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                          const SizedBox(height: 10),
                                          BuildTextFormField(
                                              controller: bioController,
                                              obscure: false,
                                              label: "Bio"),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10.0),
                                              width: 320.0,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                        child:
                                                            const Text("Save"),
                                                        onPressed: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            context
                                                                .read<
                                                                    UserListProvider>()
                                                                .addBio(
                                                                    id,
                                                                    bioController
                                                                        .text);

                                                            // print(selectedDate);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ]))
                                        ])))));
                  });
            }));
  }
}
