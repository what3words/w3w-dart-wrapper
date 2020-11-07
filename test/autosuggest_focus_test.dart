import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']);

  test('testValidFocus', () async {
    var autosuggest = await api
        .autosuggest('index.home.ra')
        .focus(Coordinates(51.2, 0.2))
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });

  test('testFocusLatitudeTooBig', () async {
    var autosuggest = await api
        .autosuggest('index.home.ra')
        .focus(Coordinates(151.2, 0.2))
        .execute();
    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.getError();
    expect(error, What3WordsError.BAD_FOCUS);
  });

  test('testFocusLatitudeTooSmall', () async {
    var autosuggest = await api
        .autosuggest('index.home.ra')
        .focus(Coordinates(-151.2, 0.2))
        .execute();
    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.getError();
    expect(error, What3WordsError.BAD_FOCUS);
  });

  test('testFocusBigLongitude', () async {
    var autosuggest = await api
        .autosuggest('index.home.ra')
        .focus(Coordinates(51.2, 360.2))
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });

  test('testFocusSmallLongitude', () async {
    var autosuggest = await api
        .autosuggest('index.home.ra')
        .focus(Coordinates(51.2, -360))
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, true);
  });
}
