import 'package:flutter/material.dart';
import '../../models/user.model.dart';
import '../buttons/editbiobutton.dart';
import '../buttons/addbiobutton.dart';

// Handles the profile page of the current User
// Handles adding of Bio
class ProfileTab extends StatelessWidget {
  const ProfileTab({
    Key? key,
    required this.context,
    required this.currentUser,
  }) : super(key: key);

  final BuildContext context;
  final Users currentUser;

  @override
  Widget build(BuildContext context) {
    //Check if User has a Bio to present

    if (currentUser.bio == "") {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(children: [
            CircleAvatar(
              backgroundColor: const Color(0xffDBC1AC),
              maxRadius: 100,
              // foregroundImage: NetworkImage("enterImageUrl"),
              child: Text(
                currentUser.name.substring(0, 1),
                style: const TextStyle(
                    color: Color(0xff967259),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: BuildAddBioButton(
                    context: context, id: currentUser.userId)),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(children: [
                      Text(
                        currentUser.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Text(
                        '@${currentUser.username}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'User Id: ${currentUser.userId}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        'Birthday: ${currentUser.birthday}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        'Location: ${currentUser.location}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ])))
          ]));
    } else {
      return Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(children: [
            const SizedBox(height: 20),
            Expanded(
                child: CircleAvatar(
              backgroundColor: const Color(0xffDBC1AC),
              maxRadius: 100,
              // foregroundImage: NetworkImage("enterImageUrl"),
              child: Text(
                currentUser.name.substring(0, 1),
                style: const TextStyle(
                    color: Color(0xff967259),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            )),
            Align(
                alignment: Alignment.centerLeft,
                child: BuildEditBioButton(
                    context: context, id: currentUser.userId)),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(children: [
                      Text(
                        currentUser.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Text(
                        '@${currentUser.username}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        currentUser.bio,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'User Id: ${currentUser.userId}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        'Birthday: ${currentUser.birthday}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        'Location: ${currentUser.location}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ])))
          ]));
    }
  }
}
