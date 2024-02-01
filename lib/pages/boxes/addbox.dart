import 'package:exercise6/pages/buttons/viewfriendbutton.dart';
import 'package:flutter/material.dart';
import '../../models/user.model.dart';
import '../buttons/addfriendbutton.dart';

//Container for the user for adding
class Addbox extends StatelessWidget {
  const Addbox(
      {Key? key,
      required this.context,
      required this.name,
      required this.username,
      required this.friend,
      required this.friendUid,
      required this.currentUser,
      required this.userUid})
      : super(key: key);

  final BuildContext context;
  final String name;
  final String username;
  final String friendUid;
  final String userUid;
  final Users friend;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff967259),
                  maxRadius: 20,
                  child: Text(
                    friend.name.substring(0, 1),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '@$username',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        )),
                  ],
                )
              ],
            ),
            Row(
              children: [
                BuildAddfriendButton(
                  context: context,
                  friendUid: friendUid,
                  userUid: userUid,
                ),
                BuildViewFriendButton(
                    context: context, friend: friend, currentUser: currentUser),
              ],
            )
          ],
        ));
  }
}
