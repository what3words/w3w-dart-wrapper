import 'package:test/test.dart';
import 'package:what3words/src/request/autosuggest_options.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testSimpleCircleClip', () async {
    var options = AutosuggestOptions().setClipToCircle(Coordinates(-90.000000, 360.0), 100);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);
  });

  test('testSimpleCircleClipLatCannotWrap', () async {
    var options = AutosuggestOptions().setClipToCircle(Coordinates(-91.000000, 360.0), 100);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.error();
    expect(error, What3WordsError.BAD_CLIP_TO_CIRCLE);
  });

  test('testSimpleCircleClipLatBigDistance', () async {
    var options = AutosuggestOptions().setClipToCircle(Coordinates(0.000000, 0.0), 10000000);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);
  });

  test('testBoundingBox', () async {
    var sw = Coordinates(50, -5);
    var ne = Coordinates(53, 2);

    var options = AutosuggestOptions().setClipToBoundingBox(sw, ne);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
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

  test('testBoundingBoxInfinitelySmall', () async {
    var sw = Coordinates(50, -5);
    var ne = Coordinates(50, -5);

    var options = AutosuggestOptions().setClipToBoundingBox(sw, ne);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, false);
  });

  test('testBoundingBoxLngWraps', () async {
    var sw = Coordinates(50, -5);
    var ne = Coordinates(53, 3544);

    var options = AutosuggestOptions().setClipToBoundingBox(sw, ne);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
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

  test('testBoundingBoxThatWrapsAroundWorldButExcludesLondon', () async {
    var sw = Coordinates(50, 2);
    var ne = Coordinates(53, 355);

    var options = AutosuggestOptions().setClipToBoundingBox(sw, ne);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();
    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, false);
  });

  test('testBoundingBoxThatWrapsAroundPolesButExcludesLondon', () async {
    var sw = Coordinates(53, -5);
    var ne = Coordinates(230, 2);

    var options = AutosuggestOptions().setClipToBoundingBox(sw, ne);
    var autosuggest = await api
        .autosuggest('index.home.ra', options: options)
        .execute();

    expect(autosuggest.isSuccessful(), false);
    expect(autosuggest.error(), What3WordsError.BAD_CLIP_TO_BOUNDING_BOX);
  });

  test('clipToCountryThatDoesNotExist', () async {
    var options = AutosuggestOptions().setClipToCountry(['ZX']);
    var autosuggest =
        await api.autosuggest('index.home.raf', options: options)
            .execute();

    expect(autosuggest.isSuccessful(), true);

    var suggestions = autosuggest.data()!.suggestions;

    var found = false;
    for (var s in suggestions) {
      if (s.words == 'index.home.raft') {
        found = true;
      }
    }
    expect(found, false);
  });

  test('clipToCountryThatDoesNotExist', () async {
    var options = AutosuggestOptions().setClipToCountry(['ZXC']);
    var autosuggest = await api
        .autosuggest('index.home.raf', options: options)
        .execute();

    expect(autosuggest.isSuccessful(), false);

    var error = autosuggest.error();
    expect(error, What3WordsError.BAD_CLIP_TO_COUNTRY);
  });
}
