import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testWithCoordinates', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, 0.2));

    var autosuggest = await api
        .autosuggestWithCoordinates('index.home.ra', options: options)
        .execute();

    // print('Autosuggest successful: ${autosuggest.isSuccessful()}');

    if (!autosuggest.isSuccessful()) {
      var error = autosuggest.error();
      // print('Autosuggest Error: ${error?.code} - ${error?.message}');
      if (error?.message?.contains('Auth failed') ?? false) {
        print(
            'Skipping test due to authentication failure on the autosuggest-with-coordinates endpoint.');
        return;
      }
    }

    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()?.suggestions ?? [];
    print('Suggestions count: ${suggestions.length}');

    if (suggestions.isEmpty) {
      fail('No suggestions returned by autosuggestWithCoordinates');
    }

    var foundWithCoordinates = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        foundWithCoordinates = true;
        var autosuggestSelection = await api
            .autosuggestSelection('index.home.ra', 'text', s.words, s.rank,
                options: options)
            .execute();

        if (!autosuggestSelection.isSuccessful()) {
          var error = autosuggestSelection.error();
          fail('AutosuggestSelection request failed: ${error?.message}');
        }
        expect(autosuggestSelection.isSuccessful(), true);
      }
    }

    expect(foundWithCoordinates, true);
  });
}
