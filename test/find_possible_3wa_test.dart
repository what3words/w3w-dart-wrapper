import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  group('findPossible3wa Tests', () {
    var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

    test('Single valid what3words address', () {
      // This should return a list with one address
      var result = api.findPossible3wa("Please go to filled.count.soap.");
      expect(result, equals(["filled.count.soap"]));
    });

    test('Multiple what3words addresses', () {
      // This should return a list with two addresses
      var result = api.findPossible3wa("Check filled.count.soap and index.home.raft.");
      expect(result, equals(["filled.count.soap", "index.home.raft"]));
    });

    test('No what3words addresses', () {
      // This should return an empty list
      var result = api.findPossible3wa("This string has no valid what3words addresses.");
      expect(result, isEmpty);
    });

    test('Valid what3words address embedded in text', () {
      // This should return a list with one address found within text
      var result = api.findPossible3wa("Leave the package at filled.count.soap or at the back door.");
      expect(result, equals(["filled.count.soap"]));
    });

    test('Edge case - address with invalid characters', () {
      // This should return a list with a what3words address even if it has invalid characters at the end of the words
      var result = api.findPossible3wa("Address like filled.count.soap! is invalid.");
      expect(result, equals(["filled.count.soap"]));
    });
  });
}
