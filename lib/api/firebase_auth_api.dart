import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<User?> getUser() {
    return auth.authStateChanges();
  }

  //Handles Signin In
  Future<String> signIn(String email, String password) async {
    UserCredential credential;
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //possible to return something more useful
        //than just print an error message to improve UI/UX
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
    }
    return ("");
  }

  //Handles Signing Up
  Future<int> signUp(String email, String password, String name, String bday,
      String location, String username) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        saveUserToFirestore(
            credential.user?.uid, email, name, bday, location, username);
      }
      // return ('Successfully created User');
      return 1;
    } on FirebaseAuthException catch (e) {
      //possible to return something more useful
      //than just print an error message to improve UI/UX
      if (e.code == 'weak-password') {
        // return ('The password provided is too weak.');
        return 0;
      } else if (e.code == 'email-already-in-use') {
        // return ('The account already exists for that email.');
        return 0;
      }
    }

    return 0;
  }

  //Handles Signing Out
  void signOut() async {
    auth.signOut();
  }

  //Handles Adding of ther information to the user
  void saveUserToFirestore(String? uid, String email, String name, String bday,
      String location, String username) async {
    try {
      final data = {
        "userId": uid,
        "name": name,
        "birthday": bday,
        "location": location,
        "username": username,
        "email": email,
        "bio": "",
        "friends": [],
        "friendRequest": [],
        "pendingFriendRequest": []
      };
      db.collection("users").doc(uid).set(data, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
