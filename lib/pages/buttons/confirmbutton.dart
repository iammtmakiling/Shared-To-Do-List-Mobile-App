import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

//Handles the Confirmation of a Friend Request
class BuildConfirmButton extends StatelessWidget {
  const BuildConfirmButton({
    Key? key,
    required this.context,
    required this.friendUid,
    required this.userUid,
  }) : super(key: key);

  final BuildContext context;
  final String friendUid;
  final String userUid;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: IconButton(
          icon: const Icon(Icons.check, color: Color(0xff567d51)),
          onPressed: () {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Do you want to confirm the request?'),
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
                                        child: const Text("Accept"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context
                                              .read<UserListProvider>()
                                              .confirmRequest(
                                                  friendUid, userUid);
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
