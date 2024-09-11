import 'package:what3words/what3words.dart';

void main() async {
  // Replace 'what3words-api-key' with your actual API key
  var api = What3WordsV3('what3words-api-key');

  print("\n-------Example 1: Using isPossible3wa-------\n");
  List<String> addresses = [
    "filled.count.soap",
    "not a 3wa",
    "not.3wa address"
  ];

  // Check if the addresses are possible what3words addresses
  for (String address in addresses) {
    bool isPossible = api.isPossible3wa(address);
    print("Is '$address' a possible what3words address? $isPossible");
  }

  print("\n-------Example 2: Using didYouMean3wa-------\n");
  String typoAddress = "index,home raft";
  bool didYouMean = api.didYouMean3wa(typoAddress);
  print("Did you mean a what3words address with '$typoAddress'? $didYouMean");

  print("\n-------Example 3: Using findPossible3wa-------\n");
  List<String> texts = [
    "Please leave by my porch at filled.count.soap",
    "Please leave by my porch at filled.count.soap or deed.tulip.judge",
    "Please leave by my porch at"
  ];

  // Check each text for possible what3words addresses
  for (String text in texts) {
    List<String> possibleAddresses = api.findPossible3wa(text);
    print("Possible what3words addresses in '$text': $possibleAddresses");
  }

  print("\n-------Example 4: Using isValid3wa-------\n");
  List<String> w3wAddresses = [
    "filled.count.soap",
    "filled.count.",
    "coding.is.cool"
  ];

  // Iterate over the list and check if each address is valid
  for (String w3w_address in w3wAddresses) {
    var response = await api.isValid3wa(w3w_address);

    if (response.isSuccessful() && response.isValid == true) {
      print("$w3w_address is a valid what3words address");
    } else if (response.isSuccessful() && response.isValid == false) {
      print("$w3w_address is an invalid what3words address");
    } else {
      print(
          "isValid3wa error: ${response.error?.code} - ${response.error?.message}");
    }
  }
}
