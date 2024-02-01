import 'package:exercise6/pages/friendsprofile.dart';
import 'package:flutter/material.dart';
import '../../models/user.model.dart';

//Handles the transition to the friends tab
class BuildViewFriendButton extends StatelessWidget {
  const BuildViewFriendButton({
    Key? key,
    required this.context,
    required this.friend,
    required this.currentUser,
  }) : super(key: key);

  final BuildContext context;
  final Users friend;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: TextButton(
          child: const Text('View'),
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FriendsProfilePage(
                    context: context, friend: friend, currentUser: currentUser),
              ),
            );
          },
        ));
  }
}
