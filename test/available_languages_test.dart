import 'package:test/test.dart';
import 'package:what3words/what3words.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('testLanguages', () async {
    var languages = await api
        .availableLanguages()
        .execute();
    expect(languages.isSuccessful(), true);
    languages.data()?.languages;
  });
}
