import 'package:what3words/what3words.dart';
import 'package:test/test.dart';
import 'dart:io' show Platform;

void main() {
  var api = What3WordsV3(Platform.environment['W3W_API_KEY']!);

  test('invalid3waTest', () async {
    var locationRequest = await api.convertToCoordinates('filled').execute();
    
    expect(locationRequest.isSuccessful(), false);

    var error = locationRequest.error();
    expect(error, isNotNull);  // Ensure that the error is not null

    if (error != null) {
      if (error == What3WordsError.BAD_WORDS) {
        expect(error, What3WordsError.BAD_WORDS);
      } else if (error == What3WordsError.QUOTAEXCEEDED_ERROR) {
        expect(error, What3WordsError.QUOTAEXCEEDED_ERROR);
      } else {
        fail('Unexpected error type: ${error.toString()}');
      }
    }
  });

  test('valid3waTest', () async {
    var locationRequest = await api.convertToCoordinates('filled.count.soap').execute();

    if (locationRequest.isSuccessful()) {
      expect(locationRequest.isSuccessful(), true);
      var location = locationRequest.data()!;

      expect(location.words, 'filled.count.soap');
      expect(location.country, 'GB');

      expect(location.square.southwest.lng, closeTo(-0.195543, 0.000001));
      expect(location.square.southwest.lat, closeTo(51.520833, 0.000001));
      expect(location.square.northeast.lng, closeTo(-0.195499, 0.000001));
      expect(location.square.northeast.lat, closeTo(51.52086, 0.000001));

      expect(location.coordinates.lng, closeTo(-0.195521, 0.000001));
      expect(location.coordinates.lat, closeTo(51.520847, 0.000001));

      expect(location.language, 'en');
      expect(location.map, 'https://w3w.co/filled.count.soap');
      expect(location.nearestPlace, 'Bayswater, London');
    } else {
      var error = locationRequest.error();
      expect(error, isNotNull);  // Ensure that the error is not null

      if (error != null) {
        if (error == What3WordsError.BAD_WORDS) {
          expect(error, What3WordsError.BAD_WORDS);
        } else if (error == What3WordsError.QUOTAEXCEEDED_ERROR) {
          expect(error, What3WordsError.QUOTAEXCEEDED_ERROR);
        } else {
          fail('Unexpected error type: ${error.toString()}');
        }
      }
    }
  });
}
