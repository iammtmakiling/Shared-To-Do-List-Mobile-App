import 'package:flutter/material.dart';
import '../../models/user.model.dart';

// ignore: must_be_immutable
// Handles the profile page of the friend
class FriendProfileTab extends StatelessWidget {
  const FriendProfileTab({
    Key? key,
    required this.context,
    required this.friend,
  }) : super(key: key);

  final BuildContext context;
  final Users friend;

  @override
  Widget build(BuildContext context) {
    if (friend.bio == "") {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(children: [
            CircleAvatar(
              backgroundColor: const Color(0xffDBC1AC),
              maxRadius: 100,
              // foregroundImage: NetworkImage("enterImageUrl"),
              child: Text(
                friend.name.substring(0, 1),
                style: const TextStyle(
                  color: Color(0xff967259),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(children: [
                  Text(
                    friend.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: "Roboto",
                      color: Color(0xff967259),
                    ),
                  ),
                  Text(
                    '@${friend.username}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff967259),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'User Id: ${friend.userId}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    'Birthday: ${friend.birthday}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    'Location: ${friend.location}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ]))
          ]));
    } else {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(children: [
            CircleAvatar(
              backgroundColor: const Color(0xffDBC1AC),
              maxRadius: 100,
              child: Text(
                friend.name.substring(0, 1),
                style: const TextStyle(
                    color: Color(0xff967259),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(children: [
                  Text(
                    friend.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: "Roboto",
                      color: Color(0xff967259),
                    ),
                  ),
                  Text('@${friend.username}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff967259),
                      )),
                  Text(
                    friend.bio,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xff967259),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'User Id: ${friend.userId}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    'Birthday: ${friend.birthday}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    'Location: ${friend.location}',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ]))
          ]));
    }
  }
}
