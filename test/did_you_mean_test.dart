import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  group('didYouMean3wa Tests', () {
    var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

    test('Valid typo what3words address', () {
      // This is a valid typo what3words address
      String typoAddress = "index.home raft";
      bool result = api.didYouMean3wa(typoAddress);
      expect(result, isTrue);
    });

    test('Valid what3words address without typos', () {
      // This is a correct what3words address without any typos
      String validAddress = "filled.count.soap";
      bool result = api.didYouMean3wa(validAddress);
      expect(result, isTrue);
    });

    test('Invalid what3words address', () {
      // This is an invalid what3words address
      String invalidAddress = "not a 3wa";
      bool result = api.didYouMean3wa(invalidAddress);
      expect(result, isFalse);
    });

    test('Valid what3words address with punctuation errors', () {
      // This address has punctuation errors and should match
      String invalidAddress = "filled,count.soap";
      bool result = api.didYouMean3wa(invalidAddress);
      expect(result, isTrue);
    });

    test('Another valid typo what3words address', () {
      // This is another valid typo what3words address
      String typoAddress = "index home raft";
      bool result = api.didYouMean3wa(typoAddress);
      expect(result, isTrue);
    });
  });
}