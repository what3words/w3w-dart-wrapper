import 'package:what3words/what3words.dart';

void main() async {
  // For all requests a what3words API key is needed
  var api = What3WordsV3('what3words-api-key');

  // Create and execute a request to obtain a grid section within the provided bounding box (sw and ne corners)
  var gridSection = await api
      .gridSection(Coordinates(51.515900, -0.212517), Coordinates(51.527649, -0.191746))
      .execute();

  if (gridSection.isSuccessful()) {
    print(gridSection.data()?.toJson());
  } else {
    var error = gridSection.error();

    if (error == What3WordsError.BAD_BOUNDING_BOX) {
      // The BoundingBox is invalid
      print('BadBoundingBox: ${error!.message}');
    } else if (error == What3WordsError.BAD_BOUNDING_BOX_TOO_BIG) {
      // The BoundingBox is too big
      print('BadBoundingBoxTooBig: ${error!.message}');
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
