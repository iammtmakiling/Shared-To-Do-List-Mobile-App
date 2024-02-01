import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../api/firebase_user_api.dart';

class UserListProvider with ChangeNotifier {
  late FirebaseUserAPI firebaseService;
  late Stream<QuerySnapshot> _userStream;
  Stream<QuerySnapshot> get users => _userStream;

  UserListProvider() {
    firebaseService = FirebaseUserAPI();
    fetchUser();
  }

  //Fetching of all users from the database
  fetchUser() {
    _userStream = firebaseService.getAllUser();
    notifyListeners();
  }

  //Confirm Friend Request
  void confirmRequest(String friendUid, String userUid) {
    FirebaseUserAPI.confirmRequest(friendUid, userUid);
  }

  //Decline Friend Request
  void declineRequest(String friendUid, String userUid) {
    FirebaseUserAPI.declineRequest(friendUid, userUid);
  }

  //Send a Friend Request
  void addFriend(String friendUid, String userUid) {
    FirebaseUserAPI.addFriend(friendUid, userUid);
  }

  //Unfriend
  void unFriend(String friendUid, String userUid) {
    FirebaseUserAPI.unfriend(friendUid, userUid);
  }

  //Add User Bio
  void addBio(String id, String bio) {
    FirebaseUserAPI.addBio(id, bio);
  }
}
