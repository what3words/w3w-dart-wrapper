import 'package:what3words/what3words.dart';

void main() async {
  // Replace 'what3words-api-key' with your actual API key
  var api = What3WordsV3('what3words-api-key');

  // Example 1: Using isPossible3wa
  String address1 = "index.home.raft";
  bool possible1 = api.isPossible3wa(address1);
  print("Is '$address1' a possible what3words address? $possible1");

  String address2 = "index-home-raft";
  bool possible2 = api.isPossible3wa(address2);
  print("Is '$address2' a possible what3words address? $possible2");

  // Example 2: Using didYouMean3wa
  String typoAddress = "indez.home.raft";
  bool didYouMean = api.didYouMean3wa(typoAddress);
  print("Did you mean a what3words address with '$typoAddress'? $didYouMean");

  // Example 3: Using findPossible3wa
  String text = "Meet me at index.home.raft and then we can go to table.chair.lamp.";
  List<String> foundAddresses = api.findPossible3wa(text);
  print("Found possible what3words addresses in text:");
  for (var addr in foundAddresses) {
    print("- $addr");
  }

  // Example 4: Using isValid3wa
  String validAddress = "index.home.raft";
  bool isValid = await api.isValid3wa(validAddress);
  print("Is '$validAddress' a valid what3words address? $isValid");

  String invalidAddress = "this.is.invalid";
  bool isInvalid = await api.isValid3wa(invalidAddress);
  print("Is '$invalidAddress' a valid what3words address? $isInvalid");

  // Additional Example: Handling conversion with error checking
  var coordinates = await api.convertToCoordinates('index.home.raft').execute();

  if (coordinates.isSuccessful()) {
    print('Coordinates: ${coordinates.data()?.toJson()}');
  } else {
    var error = coordinates.error();

    if (error == What3WordsError.BAD_WORDS) {
      // The three word address provided is invalid
      print('BadWords: ${error!.message}');
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
