import 'package:what3words/what3words.dart';

void main() async {
  // For all requests a what3words API key is needed
  var api = What3WordsV3('what3words-api-key');

  // Create and execute a request to obtain a grid section within the provided bounding box
  var coordinates = await api.convertToCoordinates('index.home.raft').execute();

  if (coordinates.isSuccessful()) {
    print('Coordinates ${coordinates.data()?.toJson()}');
  } else {
    var error = coordinates.error();

    if (error == What3WordsError.BAD_WORDS) {
      // The three word address provided is invalid
      print('BadWords: ${error!.message}');
    } else if (error == What3WordsError.QUOTAEXCEEDED_ERROR) {
      // QuotaExceeded Error
      print('QuotaExceeded: ${error!.message}');
    } else if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
      // Server Error
      print('InternalServerError: ${error!.message}');
    } else if (error == What3WordsError.NETWORK_ERROR) {
      // Network Error
      print('NetworkError: ${error!.message}');
    } else {
      print('${error!.code} : ${error.message}');
    }
  }
}
