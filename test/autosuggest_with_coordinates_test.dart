import 'package:test/test.dart';
import 'package:what3words/src/request/autosuggest_options.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testWithCoordinates', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, 0.2));
    var autosuggest = await api
        .autosuggestWithCoordinates('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var foundWithCoordinates = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        foundWithCoordinates = true;
        var autosuggestSelection = await api.autosuggestSelection('index.home.ra', 'text', s.words, s.rank, options: options).execute();
        expect(autosuggestSelection.isSuccessful(), true);
      }
    }

    expect(foundWithCoordinates, true);
  });
}
