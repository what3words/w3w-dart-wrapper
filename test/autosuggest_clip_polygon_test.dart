import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testPolygonClip', () async {
    // Polygon must have at least 4 entries
    var p1 = Coordinates(51, -1);
    var p2 = Coordinates(53, 0);
    var p3 = Coordinates(51, 1);

    var options = AutosuggestOptions().setClipToPolygon([p1, p2, p3, p1]);
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

  test('testPolygonClipWithTooFewPoints', () async {
    // Polygon must have at least 4 entries
    var p1 = Coordinates(51, -1);
    var p2 = Coordinates(53, 0);
    var p3 = Coordinates(51, 1);

    var options = AutosuggestOptions().setClipToPolygon([p1, p2, p3]);
    var autosuggest =
        await api.autosuggest('index.home.ra', options: options).execute();

    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.error();
    expect(error, What3WordsError.BAD_CLIP_TO_POLYGON);
  });

  test('testPolygonClipWithHugeLongitude', () async {
    //Polygon must have at least 4 entries
    var p1 = Coordinates(51, -181);
    var p2 = Coordinates(53, 0);
    var p3 = Coordinates(51, 181);

    var options = AutosuggestOptions().setClipToPolygon([p1, p2, p3, p1]);
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
}
