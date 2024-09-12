import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  group('Available Languages Tests', () {
    test('testLanguages', () async {
      var response = await api.availableLanguages().execute();
      expect(response.isSuccessful(), true);

      var languages = response.data()?.languages;
      expect(languages, isNotNull); // Ensure languages list is not null
      expect(languages!.isNotEmpty, true); // Ensure the list is not empty

      for (var language in languages) {
        // Check that the basic properties are not null or empty
        expect(language.name, isNotEmpty);
        expect(language.code, isNotEmpty);
        expect(language.nativeName, isNotEmpty);

        // If locales are available, ensure they are valid
        if (language.locales != null && language.locales!.isNotEmpty) {
          for (var locale in language.locales!) {
            expect(locale.name, isNotEmpty);
            expect(locale.code, isNotEmpty);
            expect(locale.nativeName, isNotEmpty);
          }
        } else {
          // Optionally check that locales can be null or an empty list
          expect(language.locales, anyOf(isNull, isEmpty));
        }
      }
    });

    test('validAvailableLanguagesTest', () async {
      // Call the availableLanguages API
      var response = await api.availableLanguages().execute();

      // Check if the response was successful
      expect(response.isSuccessful(), isTrue);

      // Retrieve the list of languages from the response
      var languages = response.data()?.languages;

      // Check if the list of languages is not empty
      expect(languages, isNotEmpty);

      // Verify specific languages (mn, zh, oo) are present and have locales
      var found = false;
      for (var language in languages!) {
        if ((language.code.toLowerCase() == 'mn' ||
                language.code.toLowerCase() == 'zh' ||
                language.code.toLowerCase() == 'oo') &&
            language.locales != null &&
            language.locales!.isNotEmpty) {
          found = true;
        }
      }

      // Assert that the specific languages are found
      expect(found, isTrue,
          reason: 'Failed to find locale list for zh, mn, or oo');
    });
  });
}
