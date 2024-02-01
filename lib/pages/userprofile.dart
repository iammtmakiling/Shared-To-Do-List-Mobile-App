import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.model.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import 'tabs/friendstab.dart';
import 'tabs/profileTab.dart';
import 'tabs/requesttab.dart';
import 'tabs/searchtab.dart';
import 'tabs/sharedtodo.dart';

class OwnProfilePage extends StatefulWidget {
  const OwnProfilePage({Key? key}) : super(key: key);

  @override
  State<OwnProfilePage> createState() => _OwnProfileState();
}

//Main Profile that connects all the tabs
//The user stream of the currentUser is defined here
//together with the stream of other users from the firebase
class _OwnProfileState extends State<OwnProfilePage> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> usersStream = context.watch<UserListProvider>().users;
    final users = usersStream;
    final curUser = FirebaseAuth.instance;

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
            length: 5,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: const Color(0xff967259),
                  title: const Text(
                    'Coffiii',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Roboto"),
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.edit_note)),
                      Tab(icon: Icon(Icons.person_add)),
                      Tab(icon: Icon(Icons.person_search)),
                      Tab(icon: Icon(Icons.people)),
                    ],
                  ),
                ),
                drawer: Drawer(
                    child: Column(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            leading: const Icon(
                              Icons.logout,
                              color: Color(0xff967259),
                            ),
                            title: const Text('Logout',
                                style: TextStyle(
                                    color: Color(0xff967259),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            onTap: () {
                              context.read<AuthProvider>().signOut();
                            },
                          )),
                    ),
                  ),
                ])),
                body: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .where("userId", isEqualTo: curUser.currentUser!.uid)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot1) {
                      return StreamBuilder(
                          stream: users,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                    "Error encountered! ${snapshot.error}"),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (!snapshot.hasData) {
                              return const Center(
                                child: Text("No Users Found"),
                              );
                            }

                            var currentUser = Users.fromJson(
                                snapshot1.data?.docs[0].data()
                                    as Map<String, dynamic>);
                            return Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: TabBarView(
                                  children: [
                                    ProfileTab(
                                      context: context,
                                      currentUser: currentUser,
                                    ),
                                    ToDoTab(
                                        context: context,
                                        currentUser: currentUser),
                                    RequestTab(
                                        context: context,
                                        snapshot: snapshot,
                                        currentUser: currentUser),
                                    SearchTab(
                                        context: context,
                                        snapshot: snapshot,
                                        currentUser: currentUser),
                                    FriendsTab(
                                        context: context,
                                        snapshot: snapshot,
                                        currentUser: currentUser),
                                  ],
                                ));
                          });
                    }))));
  }
}
