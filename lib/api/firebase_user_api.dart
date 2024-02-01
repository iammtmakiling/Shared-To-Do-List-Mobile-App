import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  //Handles fetching of users
  Stream<QuerySnapshot> getAllUser() {
    return db.collection("users").snapshots();
  }

  //Handles confirming of a friend request
  static void confirmRequest(String friendUid, String userUid) {
    final ref = db.collection("users").doc(friendUid);
    final ref2 = db.collection("users").doc(userUid);
    //Adding Friends to Each Array
    ref.update({
      "friends": FieldValue.arrayUnion([userUid]),
    });
    ref2.update({
      "friends": FieldValue.arrayUnion([friendUid]),
    });

    //Removing from Pending Request
    ref.update({
      "pendingFriendRequest": FieldValue.arrayRemove([userUid]),
    });

    //Removing from Friend Request
    ref2.update({
      "friendRequest": FieldValue.arrayRemove([friendUid]),
    });
  }

  //Handles Adding of Friend
  static void addFriend(String friendUid, String userUid) {
    final ref = db.collection("users").doc(friendUid);
    final ref2 = db.collection("users").doc(userUid);
    //Adding to friend Request
    ref.update({
      "friendRequest": FieldValue.arrayUnion([userUid]),
    });

    //Adding to Pending Request
    ref2.update({
      "pendingFriendRequest": FieldValue.arrayUnion([friendUid]),
    });
  }

  //Handles Declining of a Friend Request
  static void declineRequest(String friendUid, String userUid) {
    final ref = db.collection("users").doc(friendUid);
    final ref2 = db.collection("users").doc(userUid);

    //Removing from friend Request
    ref2.update({
      "friendRequest": FieldValue.arrayRemove([userUid]),
    });

    //Removing from Pending Request
    ref.update({
      "pendingFriendRequest": FieldValue.arrayRemove([friendUid]),
    });
  }

  //Handles Unfriend
  static void unfriend(String friendUid, String userUid) {
    final ref = db.collection("users").doc(friendUid);
    final ref2 = db.collection("users").doc(userUid);

    //Removing from friends
    ref.update({
      "friends": FieldValue.arrayRemove([userUid]),
    });
    ref2.update({
      "friends": FieldValue.arrayRemove([friendUid]),
    });
  }

  //Handles Adding of Bio
  static void addBio(String id, String bio) async {
    try {
      await db.collection("users").doc(id).update({
        "bio": bio,
      }).onError((e, _) => print("Error writing document: $e"));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
