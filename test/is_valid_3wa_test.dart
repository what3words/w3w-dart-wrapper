import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  group('isValid3wa Tests - ', () {
    var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

    test('Valid what3words address returns true', () async {
      var response = await api.isValid3wa("filled.count.soap");
      // Print the response and any errors

      if (!response.isSuccessful()) {
        print("Error: ${response.error?.code} - ${response.error?.message}");
      }
      // Ensure that the response indicates the address is valid
      expect(response.isSuccessful(), isTrue);
      expect(response.error, isNull);
      expect(response.isValid, isTrue);
    });
    test('Invalid what3words address returns false', () async {
      var response = await api.isValid3wa("filled.count.sos");
      // Print the response and any errors

      if (!response.isSuccessful()) {
        print("Error: ${response.error?.code} - ${response.error?.message}");
      }
      // Ensure that the response indicates the address is invalid
      expect(response.isSuccessful(), isTrue);
      expect(response.error, isNull);
      expect(response.isValid, isFalse);
    });
    test('Invalid API key returns INVALID_KEY error', () async {
      var invalidApi = What3WordsV3('wrong_api_key');
      var response = await invalidApi.isValid3wa("filled.count.soap");
      // Print the response and any errors

      if (!response.isSuccessful()) {
        print("Error: ${response.error?.code} - ${response.error?.message}");
      }
      // Ensure that the response indicates an invalid API key error
      expect(response.isSuccessful(), isFalse);
      expect(response.isValid, isNull);
      expect(response.error, What3WordsError.INVALID_KEY);
    });
  });
}

