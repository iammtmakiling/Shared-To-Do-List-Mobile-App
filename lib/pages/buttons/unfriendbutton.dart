import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

//Handles unfriending
class BuildUnfriendButton extends StatelessWidget {
  const BuildUnfriendButton({
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
        // width: 80,
        // height: 30,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ElevatedButton(
          child: const Text(
            'Unfriend',
            style: TextStyle(fontSize: 10),
          ),
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
                                      'Do you want to unfriend the user?'),
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
                                        child: const Text("Unfriend"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context
                                              .read<UserListProvider>()
                                              .unFriend(friendUid, userUid);
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
