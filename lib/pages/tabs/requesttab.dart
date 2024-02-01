import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.model.dart';
import '../boxes/requestbox.dart';

// Handles all Friend Request
class RequestTab extends StatelessWidget {
  const RequestTab(
      {Key? key,
      required this.context,
      required this.currentUser,
      required this.snapshot})
      : super(key: key);

  final BuildContext context;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    int userCount = 0;
    return Scaffold(
        body: ListView.builder(
      itemCount: snapshot.data?.docs.length,
      itemBuilder: ((context, index) {
        Users user = Users.fromJson(
            snapshot.data?.docs[index].data() as Map<String, dynamic>);

        //Check if the user is present in the frien request
        if (currentUser.friendRequest.contains(user.userId.toString()) &&
            currentUser.userId != user.userId) {
          userCount++;
          return Requestbox(
              context: context,
              name: user.name,
              username: user.username,
              friendUid: user.userId,
              userUid: currentUser.userId);
        }

        //Check if there are any friend request
        if (index == (snapshot.data?.docs.length)! - 1) {
          if (userCount == 0) {
            return Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Friend Request!",
                    )));
          }
        }
        return Container();
      }),
    ));
  }
}
