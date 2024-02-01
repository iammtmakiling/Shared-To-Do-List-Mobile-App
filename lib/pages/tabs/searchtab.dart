import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.model.dart';
import '../boxes/addbox.dart';
import '../boxes/userbox.dart';

class SearchTab extends StatefulWidget {
  const SearchTab(
      {Key? key,
      required this.context,
      required this.snapshot,
      required this.currentUser})
      : super(key: key);

  final BuildContext context;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  final Users currentUser;

  @override
  // ignore: library_private_types_in_public_api
  _SearchTab createState() => _SearchTab();
}

//Handles the searching of friends
class _SearchTab extends State<SearchTab> {
  String searching = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: TextFormField(
          onChanged: (val) {
            setState(() {
              searching = val;
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Search",
          ),
        ),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: widget.snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = Users.fromJson(widget.snapshot.data?.docs[index]
                    .data() as Map<String, dynamic>);

                //Only presents the users being searched
                //Don't present currentUser
                if (data.name.toLowerCase().contains(searching.toLowerCase()) &&
                    data.userId != widget.currentUser.userId) {
                  //Check if user is friends of the currentUser for the Add Button
                  if (widget.currentUser.friends.contains(data.userId) !=
                          true &&
                      !widget.currentUser.friendRequest.contains(data.userId) &&
                      !widget.currentUser.pendingFriendRequest
                          .contains(data.userId)) {
                    return Addbox(
                        context: context,
                        friend: data,
                        name: data.name,
                        username: data.username,
                        friendUid: data.userId,
                        userUid: widget.currentUser.userId,
                        currentUser: widget.currentUser);
                  } else {
                    return Userbox(
                        context: context,
                        friend: data,
                        name: data.name,
                        username: data.username,
                        currentUser: widget.currentUser);
                  }
                }
                return Container();
              }))
    ]));
  }
}
