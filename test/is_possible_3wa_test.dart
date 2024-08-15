import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  group('isPossible3wa Tests', () {
    var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

    test('Valid what3words format', () {
      // This should return true as it is a valid what3words format
      expect(api.isPossible3wa("filled.count.soap"), isTrue);
    });

    test('Invalid what3words format', () {
      // This should return false as it is not a valid what3words format
      expect(api.isPossible3wa("not a 3wa"), isFalse);
    });

    test('Invalid format with incomplete address', () {
      // This should return false as it is incomplete
      expect(api.isPossible3wa("filled.count."), isFalse);
    });

    test('Valid format with special characters', () {
      // This should return false as special characters are not allowed
      expect(api.isPossible3wa("filled.count.soap!"), isFalse);
    });

    test('Valid format with extra spaces', () {
      // This should return false due to extra spaces
      expect(api.isPossible3wa(" filled.count.soap "), isFalse);
    });
  });
}
