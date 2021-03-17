import 'package:test/test.dart';
import 'package:what3words/src/request/autosuggest_options.dart';
import 'package:what3words/what3words.dart';

void main() {
  var api = What3WordsV3.withEndpoint('6K5JNGE7','https://api.london.dev.w3w.io/v3');

  test('testWithCoordinates', () async {
    var options = AutosuggestOptions().setFocus(Coordinates(51.2, 0.2));
    var autosuggest = await api
        .autosuggestWithCoordinates('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.suggestions;

    var foundWithCoordinates = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft' && s.coordinates != null) {
        foundWithCoordinates = true;
        var autosuggestSelection = await api.autosuggestSelection('index.home.ra', 'text', s, options: options).execute();
        expect(autosuggestSelection.isSuccessful(), true);
      }
    }

    expect(foundWithCoordinates, true);
  });
}
