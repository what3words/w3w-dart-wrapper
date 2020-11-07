# <img src="https://what3words.com/assets/images/w3w_square_red.png" width="64" height="64" alt="what3words">&nbsp;w3w-dart-wrapper

A Dart library to use the [what3words v3 API](https://docs.what3words.com/api/v3/).

API methods are grouped into a single service object which can be centrally managed by a What3WordsV3 instance. It will act as a factory for all of the API endpoints and will automatically initialize them with your API key.

To obtain an API key, please visit [https://what3words.com/select-plan](https://what3words.com/select-plan) and sign up for an account.

## Installation

The artifact is available through [pub.dev](https://pub.dev/packages/what3words). Update your `pubspec.yaml` file with 

```
dependencies:
 what3words: 3.0.2
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

### Example convert to coordinates

```
// For all requests a what3words API key is needed
var api = What3WordsV3('what3words-api-key');

// Create and execute a request to obtain a grid section within the provided bounding box
var coordinates = await api.convertToCoordinates('index.home.raft').execute();

if (coordinates.isSuccessful()) {
  print('Coordinates ${coordinates.toJson()}');
} else {
  var error = coordinates.getError();

  if (error == What3WordsError.BAD_WORDS) {
    // The three word address provided is invalid
    print('BadWords: ${error.message}');
  } else if (error == What3WordsError.INTERNAL_SERVER_ERROR) {
    // Server Error
    print('InternalServerError: ${error.message}');
  } else if (error == What3WordsError.NETWORK_ERROR) {
    // Network Error
    print('NetworkError: ${error.message}');
  } else {
    print('${error.code} : ${error.message}');
  }
}
```
