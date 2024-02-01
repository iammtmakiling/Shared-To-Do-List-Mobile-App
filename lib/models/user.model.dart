import 'dart:convert';

//Model for the User
//Must contain all the information stated
class Users {
  String userId;
  String name;
  String birthday;
  String username;
  String location;
  String email;
  String bio;
  List friends;
  List friendRequest;
  List pendingFriendRequest;

  Users(
      {required this.userId,
      required this.name,
      required this.birthday,
      required this.bio,
      required this.email,
      required this.location,
      required this.friends,
      required this.username,
      required this.friendRequest,
      required this.pendingFriendRequest});

  // Factory constructor to instantiate object from json format
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        userId: json['userId'],
        location: json['location'],
        name: json['name'],
        birthday: json['birthday'],
        bio: json['bio'],
        email: json['email'],
        friends: json['friends'],
        username: json['username'],
        friendRequest: json['friendRequest'],
        pendingFriendRequest: json['pendingFriendRequest']);
  }

  static List<Users> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Users>((dynamic d) => Users.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Users user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'bio': user.bio,
      'friends': user.friends,
      'location': user.location,
      'username': user.username,
      'friendRequest': user.friendRequest,
      'pendingFriendRequest': user.pendingFriendRequest
    };
  }
}
