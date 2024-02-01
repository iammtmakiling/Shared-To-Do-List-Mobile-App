import 'package:exercise6/pages/tabs/friendsharedtodo.dart';
import 'package:exercise6/pages/tabs/friendsprofiletab.dart';
import 'package:flutter/material.dart';
import '../models/user.model.dart';

class FriendsProfilePage extends StatefulWidget {
  const FriendsProfilePage(
      {Key? key,
      required this.context,
      required this.friend,
      required this.currentUser})
      : super(key: key);

  final BuildContext context;
  final Users friend;
  final Users currentUser;

  @override
  State<FriendsProfilePage> createState() => _FriendsProfileState();
}

//Main Profile for the friends that connects all the tabs
//The user stream of the friend selected is defined here
class _FriendsProfileState extends State<FriendsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff967259),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff967259),
            foregroundColor: Colors.white,
          )),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: const Color(0xff967259),
          )),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Color(0xff967259)),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Color(0xff967259)),
            ),
            labelStyle: TextStyle(color: Color(0xff967259)),
          ),
          tabBarTheme: const TabBarTheme(
              labelColor: Color(0xffDBC1AC),
              unselectedLabelColor: Colors.white,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff967259)))),
          fontFamily: 'Roboto',
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xff967259),
                  title: const Text('Coffiii',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontFamily: "Roboto")),
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.edit_note)),
                    ],
                  ),
                ),
                body: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TabBarView(
                      children: [
                        FriendProfileTab(
                          context: context,
                          friend: widget.friend,
                        ),
                        FriendToDoTab(
                            context: context,
                            currentUser: widget.currentUser,
                            friend: widget.friend),
                      ],
                    )))));
  }
}
