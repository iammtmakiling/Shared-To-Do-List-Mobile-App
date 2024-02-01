import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/firebase_auth_api.dart';
import '../api/firebase_todo_api.dart';

class AuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  User? userObj;

  AuthProvider() {
    authService = FirebaseAuthAPI();
    authService.getUser().listen((User? newUser) {
      userObj = newUser;
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $newUser');
      notifyListeners();
    }, onError: (e) {
      // provide a more useful error
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $e');
    });
  }

  User? get user => userObj;

  //Check if user is Authenticated
  bool get isAuthenticated {
    return user != null;
  }

  //Get User Id
  String getUserID() {
    return user!.uid;
  }

  //Sign In User
  Future<String> signIn(String email, String password) async {
    Future<String> mes = authService.signIn(email, password);

    return mes;
  }

  //Sign Out
  void signOut() {
    authService.signOut();
  }

  //Sign Up User
  Future<int> signUp(String email, String password, String name, String bday,
      String location, String username) async {
    Future<int> status =
        authService.signUp(email, password, name, bday, location, username);

    return status;
  }
}
