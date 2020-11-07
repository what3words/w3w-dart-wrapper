import 'package:what3words/what3words.dart';

void main() async {
  // For all requests a what3words API key is needed
  var api = What3WordsV3('what3words-api-key');

  // Create and execute a request to obtain a grid section within the provided bounding box
  var languages = await api.availableLanguages().execute();

  if (languages.isSuccessful()) {
    print('Languages: ${languages.toJson()}');
  } else {
    var error = languages.getError();

    if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
      // Server Error
      print('InternalServerError: ${error.message}');
    } else if (error == What3WordsError.NETWORK_ERROR) {
      // Network Error
      print('NetworkError: ${error.message}');
    } else {
      print('${error.code} : ${error.message}');
    }
  }
}
