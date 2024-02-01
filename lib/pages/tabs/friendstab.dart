import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.model.dart';
import '../boxes/friendbox.dart';

//Presents the currentUser's Friends
class FriendsTab extends StatelessWidget {
  const FriendsTab(
      {Key? key,
      required this.context,
      required this.snapshot,
      required this.currentUser})
      : super(key: key);

  final BuildContext context;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    int userCounter = 0;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: ((context, index) {
            Users user = Users.fromJson(
                snapshot.data?.docs[index].data() as Map<String, dynamic>);

            //Check if currentUser is friend with the user by checking the id
            if (currentUser.friends.contains(user.userId.toString())) {
              userCounter++;
              return Friendbox(
                  context: context, friend: user, currentUser: currentUser);
            }

            //Check if user has no friends
            if (index == (snapshot.data?.docs.length)! - 1) {
              if (userCounter == 0) {
                return Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "No Friends!",
                        )));
              }
            }
            return Container();
          }),
        )),
      ],
    ));
  }
}
