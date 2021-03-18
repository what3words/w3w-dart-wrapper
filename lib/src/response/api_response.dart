import 'package:chopper/chopper.dart';

import 'api_error.dart';
import 'what3words_error.dart';

/// Wrapper class for and API response. Can hold the successful result
/// or the error details
class APIResponse<T> {
  Response<T> response;
  APIError apiError;
  What3WordsError error;

  APIResponse(this.response);

  bool isSuccessful() {
    return response != null && response.isSuccessful;
  }

  T body() {
    return response == null ? null : response.body;
  }

  void setError(What3WordsError error) {
    this.error = error;
  }

  void setAPIError(APIError apiError) {
    this.apiError = apiError;
  }

  APIError getAPIError() {
    return apiError;
  }
}