import 'what3words_error.dart';

class IsValid3waResponse {
  final bool? isValid;
  final What3WordsError? error;

  // Private constructor to enforce factory usage
  IsValid3waResponse._({this.isValid, this.error});

  // Factory method to create a success response
  factory IsValid3waResponse.success(bool isValid) {
    return IsValid3waResponse._(isValid: isValid);
  }

  // Factory method to create an error response
  factory IsValid3waResponse.error(What3WordsError error) {
    return IsValid3waResponse._(error: error);
  }

  // Method to check if the response was successful
  bool isSuccessful() {
    return isValid != null && error == null;
  }
}
