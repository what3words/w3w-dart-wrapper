import 'dart:io' show Platform;
import 'package:test/test.dart';
import 'package:what3words/what3words.dart';

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testValidFocus', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, 0.2));
    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();

    var suggestions = autosuggest.data()!.suggestions;
    // print(suggestions);
    expect(autosuggest.isSuccessful(), true);
    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });

  test('testFocusLatitudeTooBig', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(151.2, 0.2));
    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();
    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.error();
    expect(error, What3WordsError.BAD_FOCUS);
  });

  test('testFocusLatitudeTooSmall', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(-151.2, 0.2));
    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();
    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.error();
    expect(error, What3WordsError.BAD_FOCUS);
  });

  test('testFocusBigLongitude', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, 360.2));

    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });

  test('testFocusSmallLongitude', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, -360));

    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });

  // New test case to test locale parameter
  test('testLocaleWithAutoSuggest', () async {
    var options = AutosuggestOptions()
        .setFocus(Coordinates(51.2, 0.2))
        .setLanguage('oo'); // Use a language that has locales

    var autosuggest = await api
        .autosuggest('бонтон.популаран.гус', options: options)
        .execute();

    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'бонтон.популаран.гусле') {
        found = true;
        // Verify the locale was returned correctly
        expect(s.language, 'oo');
        expect(s.locale, 'oo_cy');
      }
    }
    expect(found, true);
  });
}
