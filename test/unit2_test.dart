// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:exercise6/pages/sign_in.dart';
import 'package:exercise6/models/todo_model.dart';
import 'package:exercise6/models/user.model.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:exercise6/main.dart';

void main() {
  group('Validate Models', () {
    test('Test User Model constructor', () {
      final modelInstance = Users(
          userId: "1",
          email: 'kmakiling@gmail.com',
          username: 'kmak',
          name: 'Kael Makiling',
          bio: 'I love coffee',
          birthday: '11/05/2001',
          friendRequest: [],
          friends: [],
          location: 'Mati City',
          pendingFriendRequest: []);
      expect(modelInstance.userId, "1");
      expect(modelInstance.email, 'kmakiling@gmail.com');
      expect(modelInstance.username, "kmak");
      expect(modelInstance.name, "Kael Makiling");
      expect(modelInstance.bio, "I love coffee");
      expect(modelInstance.birthday, "11/05/2001");
      expect(modelInstance.location, "Mati City");
    });

    test('Test Todo Model constructor', () {
      final modelInstance = Todo(
          id: '1',
          deadline: '12/25/2022',
          description: 'Final Project',
          lastUpdateBy: '12/01/2022',
          lastUpdateOn: '12/05/2022',
          ownerId: '2',
          ownerName: 'Kael Makiling',
          status: true,
          taskname: 'CMSC 23');
      expect(modelInstance.id, "1");
      expect(modelInstance.deadline, '12/25/2022');
      expect(modelInstance.description, "Final Project");
      expect(modelInstance.lastUpdateBy, "12/01/2022");
      expect(modelInstance.lastUpdateOn, "12/05/2022");
      expect(modelInstance.ownerId, "2");
      expect(modelInstance.ownerName, "Kael Makiling");
      expect(modelInstance.status, true);
      expect(modelInstance.taskname, "CMSC 23");
    });
  });
}
