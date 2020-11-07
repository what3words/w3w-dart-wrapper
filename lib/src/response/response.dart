import 'package:json_annotation/json_annotation.dart';

import 'api_response.dart';
import 'what3words_error.dart';

part 'response.g.dart';

/// Wrapper for a successful what3words response
@JsonSerializable()
class Response<T> {
  @JsonKey(ignore: true)
  APIResponse<T> response;

  void setResponse(APIResponse<T> response) {
    this.response = response;
  }

  What3WordsError getError() {
    return response.error;
  }

  bool isSuccessful() {
    return response.isSuccessful();
  }
}
