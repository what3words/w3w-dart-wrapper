# <img src="https://what3words.com/assets/images/w3w_square_red.png" width="64" height="64" alt="what3words">&nbsp;w3w-dart-wrapper

A Dart library to use the [what3words v3 API](https://docs.what3words.com/api/v3/).

API methods are grouped into a single service object which can be centrally managed by a What3WordsV3 instance. It will act as a factory for all of the API endpoints and will automatically initialize them with your API key.

To obtain an API key, please visit [https://what3words.com/select-plan](https://what3words.com/select-plan) and sign up for an account.

## Installation

The artifact is available through [pub.dev](https://pub.dev/packages/what3words). Update your `pubspec.yaml` file with 

```
dependencies:
 what3words: 3.2.0
``` 

## Documentation

See the what3words public API [documentation](https://docs.what3words.com/api/v3/)

## Usage

### Import

Import the `what3words` library

```
import 'package:what3words/what3words.dart';
```

### Initialise

Use the following code with your API key to initialize the API:

```
var api = What3WordsV3('what3words-api-key');
```

In the case that you run our Enterprise Suite API Server yourself, you may specifty the URL to your own server like so:

```
var api = What3WordsV3.withEndpoint(
    'what3words-api-key', 
    'https://api.yourserver.com');
```

Additionally, if you run the Enterprise Suite API Server there is another named constructor to support this. Use this if you need to send custom headers to your own server:

```
var api = What3WordsV3.withHeaders(
      'what3words-api-key', 
      'https://api.yourserver.com',
      {'x-header-1': 'value-1', 'x-header-2': 'value-2'});
```

### Usage

#### Convert to what3words address

This function converts coordinates (expressed as latitude and longitude) to a what3words address.

More information about ConvertTo3wa, including returned results is available in the [what3words REST API documentation](https://docs.what3words.com/api/v3/).

Find the words for (51.508344,0.12549900):

```dart
var words = await api
  .convertTo3wa(Coordinates(51.508344, -0.12549900))
  .language('en')
  .execute();
print('Words: ${words.data()?.toJson()}');
```

#### Convert to coordinates

This function converts a what3words address to a position, expressed as coordinates of latitude and longitude.

It takes the words parameter as a string of a what3words 'table.book.chair'

More information about ConvertToCoordinates, including returned results is available in the [what3words REST API documentation](https://docs.what3words.com/api/v3/).

Find the words for ///filled.count.soap:

```dart
var coordinates = await api
	.convertToCoordinates('table.book.chair')
	.execute();
print('Coordinates ${coordinates.data()?.toJson()}');
```

#### AutoSuggest

When presented with a what3words address which may be incorrectly entered, AutoSuggest returns a list of potential correct 3 word addresses. It needs the first two words plus at least the first character of the third word to produce suggestions.

This method provides corrections for mis-typed words (including plural VS singular), and words being in the wrong order.

Optionally, clipping can narrow down the possibilities, and limit results to:

    One or more countries
    A geographic area (a circle, box or polygon)

This dramatically improves results, so we recommend that you use clipping if possible.

To improve results even further, set the Focus to user’s current location. This will make AutoSuggest return results which are closer to the user.

More information about AutoSuggest, including returned results is available in the [what3words REST API documentation](https://docs.what3words.com/api/v3/).

Code example Simple basic call:

```dart
var autosuggest = await api
	.autosuggest('fun.with.code')
	.nResults(3)
	.execute();
print('Autosuggest: ${autosuggest.data()?.toJson()}');
```


Code example AutoSuggest, clipping the results returned to the United Kingdom and Belgium:

```dart
var autosuggest = await api
	.autosuggest('fun.with.code')
	.clipToCountry(['gb', 'be'])
	.execute();
print('Autosuggest: ${autosuggest.data()?.toJson()}');
```


Code example AutoSuggest, Focus on (51.4243877,-0.34745).

```dart
var autosuggest = await api
  .autosuggest('fun.with.code')
  .focus(Coordinates(51.4243877, -0.34745))
  .execute();
print('Autosuggest: ${autosuggest.data()?.toJson()}');
```


Code example AutoSuggest, with Generic Voice input type.

```dart
var autosuggest = await api
  .autosuggest('fun with code')
  .input-type('generic-voice')
  .language('en')
  .execute();
print('Autosuggest: ${autosuggest.data()?.toJson()}');
```

#### Grid section

Grid section returns a section of the what3words 3m x 3m grid as a set of horizontal and vertical lines covering the requested area, which can then be drawn onto a map.

The requested box must not exceed 4km from corner to corner, or a BadBoundingBoxTooBig error will be returned.

More information about GridSection, including returned results is available in the [what3words REST API documentation](https://docs.what3words.com/api/v3/).

Get a grid for 52.207988,0.116126) in the south west, and 52.208867,0.117540 in the north east:

```dart
// Obtain a grid section within the provided bounding box
var gridSection = await api
      .gridSection(Coordinates(51.515900, -0.212517), Coordinates(51.527649, -0.191746))
      .execute();
print(gridSection.data()?.toJson());
```

#### Available languages

This function returns the currently supported languages. It will return the two letter code, and the name of the language both in that language and in English.

More information about AvailableLanguages, including returned results is available in the [what3words REST API documentation](https://docs.what3words.com/api/v3/).

```dart
var languages = await api
	.availableLanguages()
	.execute();
print('Languages: ${languages.data()?.toJson()}');
```

#### Handling errors

Success of failure of an API call can be determined through the use of the isSuccessful() function.

If it’s been determined that an API call was not successful, code and message values which represent the error, are accessible from through the getError() function.

```dart
var autosuggest = await api
  .autosuggest('freshen.overlook.clo')
  .clipToCountry(['fr', 'de'])	
  .execute();

if (autosuggest.isSuccessful()) {
  ...
} else {
  var error = autosuggest.getError();

  if (error == What3WordsError.BAD_CLIP_TO_COUNTRY) {
    // Invalid country clip is provided
    print('BadClipToCountry: ${error.message}');
  }
}
```

### RegEx Functions

This section introduces RegEx functions that can assist with checking and finding possible what3words addresses in strings. The three main functions covered are:

* isPossible3wa – Match what3words address format;
* findPossible3wa – Find what3words address in Text;
* isValid3wa – Verify a what3words address with the API;

#### isPossible3wa

Our API wrapper RegEx function “isPossible3wa” can be used used to detect if a text string (like “filled.count.soap“) in the format of a what3words address without having to ask the API. This functionality checks if a given string could be a what3words address. It returns true if it could be, otherwise false.

Note: This function checks the text format but not the validity of a what3words address. Use isValid3wa to verify validity.

```dart
void main() async {
  // Replace 'what3words-api-key' with your actual API key
  var api = What3WordsV3('what3words-api-key');

  List<String> addresses = ["filled.count.soap", "not a 3wa", "not.3wa address"];

  // Check if the addresses are possible what3words addresses
  for (String address in addresses) {
    bool isPossible = api.isPossible3wa(address);
    print("Is '$address' a possible what3words address? $isPossible");
  }
}
```

**Expected Output**

    isPossible3wa(“filled.count.soap”) returns true
    isPossible3wa(“not a 3wa”) returns false
    isPossible3wa(“not.3wa address”)returns false

#### findPossible3wa

Our API wrapper RegEx function “findPossible3wa” can be used to detect a what3words address within a block of text, useful for finding a what3words address in fields like Delivery Notes. For example, it can locate a what3words address in a note like “Leave at my front door ///filled.count.soap”. The function will match if there is a what3words address within the text. If no possible addresses are found, it returns an empty list.

Note:

* This function checks the text format but not the validity of a what3words address. Use isValid3wa to verify validity.
* This function is designed to work across languages but do not work for Vietnamese (VI) due to spaces within words.

```dart
void main() async {
  // Replace 'what3words-api-key' with your actual API key
  var api = What3WordsV3('what3words-api-key');

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
}
```

**Expected Output**

    findPossible3wa(“Please leave by my porch at filled.count.soap”) returns ['filled.count.soap']
    findPossible3wa(“Please leave by my porch at filled.count.soap or deed.tulip.judge”) returns ['filled.count.soap', 'deed.tulip.judge']
    findPossible3wa(“Please leave by my porch at”) returns []

#### isValid3wa

Our API wrapper RegEx function “isValid3wa” can be used to determine if a string is a valid what3words address by checking it against the what3words RegEx filter and verifying it with the what3words API.

```dart
void main() async {
  // Replace 'what3words-api-key' with your actual API key
  var api = What3WordsV3('what3words-api-key');

  List<String> w3w_addresses = [
    "filled.count.soap",
    "filled.count.",
    "coding.is.cool"
  ];

  // Iterate over the list and check if each address is valid
  for (String w3w_address in w3w_addresses) {
    var response = await api.isValid3wa(w3w_address);

    if (response.isSuccessful() && response.isValid == true) {
      print("$w3w_address is a valid what3words address");
    } else if (response.isSuccessful() && response.isValid == false) {
      print("$w3w_address is an invalid what3words address");
    } else {
      print("isValid3wa error: ${response.error?.code} - ${response.error?.message}");
    }
  }
}
```

**Expected Outputs**

    isValid3wa(“filled.count.soap”) returns True
    isValid3wa(“filled.count.”) returns False
    isValid3wa(“coding.is.cool”) returns False

Also make sure to replace <YOUR_API_KEY> with your actual API key. These functionalities provide different levels of validation for what3words addresses, from simply identifying potential addresses to verifying their existence on Earth.


### Troubleshooting

If you encounter errors or issues related to convert-to-coordinate requests while using the Free plan, please check the network panel for the following error message Error 402 payment required and its response, indicating the need to upgrade to a higher plan:

```shell
{
    "error": {
        "code": "QuotaExceeded",
        "message": "Quota Exceeded. Please upgrade your usage plan, or contact support@what3words.com"
    }
}
```


For more information, visit our [API plans page](https://accounts.what3words.com/select-plan). If you need further assistance, contact [support@what3words.com](mailto:support@what3words.com).

