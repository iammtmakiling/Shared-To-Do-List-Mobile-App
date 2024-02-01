import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

//Handles sending friend Request
class BuildAddfriendButton extends StatelessWidget {
  const BuildAddfriendButton({
    Key? key,
    required this.friendUid,
    required this.userUid,
    required this.context,
  }) : super(key: key);

  final BuildContext context;
  final String friendUid;
  final String userUid;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ElevatedButton(
          child: const Text(
            'Add',
            style: TextStyle(fontSize: 10),
          ),
          onPressed: () {
            context.read<UserListProvider>().addFriend(friendUid, userUid);
          },
        ));
  }
}
