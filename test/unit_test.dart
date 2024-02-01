// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:exercise6/pages/sign_in.dart';
import 'package:exercise6/pages/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:exercise6/main.dart';

void main() {
  group('Validate Password', () {
    test('Must contain all required characters', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("@Pokemon123");
      expect(SignupPageState.value, true);
    });
    test('Missing special character', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("Pokemon123");
      expect(SignupPageState.value, false);
    });

    test('Lack of characters', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("@P123");
      expect(SignupPageState.value, false);
    });

    test('Missing numerical character', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("@Pokemon");
      expect(SignupPageState.value, false);
    });

    test('Missing Uppercase character', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("@pokemon123");
      expect(SignupPageState.value, false);
    });

    test('Missing lowercase character', () {
      // ignore: non_constant_identifier_names
      final SignupPageState = SignupPage();

      SignupPageState.validatePassword("@POKEMON123");
      expect(SignupPageState.value, false);
    });
  });
}
