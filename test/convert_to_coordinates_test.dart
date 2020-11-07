import 'package:what3words/what3words.dart';
import 'package:test/test.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']);

  test('invalid3waTest', () async {
    var location = await api.convertToCoordinates('filled').execute();
    expect(location.isSuccessful(), false);

    var error = location.getError();
    expect(error, What3WordsError.BAD_WORDS);
  });

  test('valid3waTest', () async {
    var location =
        await api.convertToCoordinates('filled.count.soap').execute();

    expect(location.isSuccessful(), true);

    expect('filled.count.soap', location.words);
    expect('GB', location.country);

    expect(-0.195543, location.square.southwest.lng);
    expect(51.520833, location.square.southwest.lat);
    expect(-0.195499, location.square.northeast.lng);
    expect(51.52086, location.square.northeast.lat);

    expect(-0.195521, location.coordinates.lng);
    expect(51.520847, location.coordinates.lat);

    expect('en', location.language);
    expect('https://w3w.co/filled.count.soap', location.map);
    expect('Bayswater, London', location.nearestPlace);
  });
}
