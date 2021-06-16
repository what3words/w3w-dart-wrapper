import 'api_response.dart';
import 'what3words_error.dart';

/// Wrapper for a successful what3words response
class Response<T> {
  late APIResponse<T> _response;

  Response(APIResponse<T> response) {
    _response = response;
  }

  T? data() {
    return _response.body();
  }

  What3WordsError? error() {
    return _response.error;
  }

  bool isSuccessful() {
    return _response.isSuccessful();
  }
}
